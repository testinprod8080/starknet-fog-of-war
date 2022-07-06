import os
import pytest

from starkware.starknet.testing.starknet import Starknet
from sympy import true

# The path to the contract source code.
TEST_DIR = os.path.dirname(os.path.abspath(__file__))
CONTRACT_FILE = os.path.join(TEST_DIR, "../src/contracts/num_guess_game.cairo")

# Constants
FALSE = 0
TRUE = 1

def pytest_namespace():
    return {'contract': {}}

@pytest.fixture(autouse=True)
async def init_contract():
    # Create a new Starknet class that simulates the StarkNet
    # system.
    starknet = await Starknet.empty()

    # Deploy the contract.
    pytest.contract = await starknet.deploy(
        source=CONTRACT_FILE,
    )

##############
# TEST CASES #
##############

@pytest.mark.asyncio
async def test_create_game():
    contract = pytest.contract

    # Invoke increase_balance() twice.
    await contract.create_game(numHash=0x68656c6c6f).invoke()
    await contract.create_game(numHash=0x68656c6c6c).invoke()

    # Check the result of get_balance()
    game = await contract.check_game().call()
    numberToGuess = game.result.res
    assert numberToGuess.revealed == FALSE
    assert numberToGuess.number == 0

    # Reveal the game
    await contract.reveal_game(number=10, numHash=0x68656c6c6f).invoke()
    revealedGame = await contract.check_game().call()
    revealedNumber = revealedGame.result.res
    assert revealedNumber.revealed == TRUE
    assert revealedNumber.number == 10

@pytest.mark.asyncio
async def test_submit_guesses():
    contract = pytest.contract

    # Create new game
    await contract.create_game(numHash=0x68656c6c6c).invoke()

    # Submit guess1
    await contract.submit_guess(numGuess=20).invoke()

    # Check guess1
    guess1 = await contract.check_guess().call()
    assert guess1.result.res == 20

    # Submit guess2
    await contract.submit_guess(numGuess=30).invoke()

    # Check guess2
    guess2 = await contract.check_guess().call()
    assert guess2.result.res == 30

@pytest.mark.asyncio
async def test_guessed_correct():
    contract = pytest.contract

    # Create new game
    await contract.create_game(numHash=0x68656c6c6c).invoke()

    # Submit guess1
    await contract.submit_guess(numGuess=20).invoke()

    # Reveal the game
    await contract.reveal_game(number=20, numHash=0x68656c6c6c).invoke()

    # Check winners
    win = await contract.check_win().call()
    assert win.result.res == TRUE

@pytest.mark.asyncio
async def test_guessed_incorrect():
    contract = pytest.contract

    # Create new game
    await contract.create_game(numHash=0x68656c6c6c).invoke()

    # Submit guess1
    await contract.submit_guess(numGuess=20).invoke()

    # Reveal the game
    await contract.reveal_game(number=30, numHash=0x68656c6c6c).invoke()

    # Check winners
    win = await contract.check_win().call()
    assert win.result.res == FALSE