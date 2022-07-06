# Declare this file as a StarkNet contract.
%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import assert_not_zero
from starkware.cairo.common.bool import FALSE, TRUE
from starkware.starknet.common.syscalls import get_caller_address

from src.contracts.verifier import Verifier

###################
# VAR DEFINITIONS #
###################

struct NumberStored:
    member numHash : felt
    member number : felt
    member revealed : felt
end

################
# STORAGE VARS #
################

@storage_var
func game() -> (number : NumberStored):
end

@storage_var
func guess(byUser : felt) -> (res : felt):
end

#########
# VIEWS #
#########

# Returns the current game
@view
func check_game{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}() -> (res : NumberStored):
    let (number) = game.read()
    return (res=number)
end

# Returns guess by user
@view
func check_guess{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}() -> (res : felt):
    let (guesser) = get_caller_address()
    let (guessbyUser) = guess.read(byUser=guesser)
    return (res=guessbyUser)
end

# Return if I won
@view
func check_win{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}() -> (res : felt):
    # Check that number is revealed
    let (currentGame) = game.read()
    with_attr error_message("There is no number to guess"):
        assert_not_zero(currentGame.numHash)
    end
    with_attr error_message("Number has not been revealed"):
        assert_not_zero(currentGame.revealed)
    end

    # Check if my guess matches
    let (guesser) = get_caller_address()
    let (guessbyUser) = guess.read(byUser=guesser)
    if guessbyUser == currentGame.number:
        return (res=TRUE)
    else:
        return (res=FALSE)
    end
end

#############
# EXTERNALS #
#############

# Creates new game
@external
func create_game{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}(numHash : felt):
    # Obtain the address of the caller as the game creator
    # let (creator) = get_caller_address()

    let (res) = game.read()
    # cannot create a new game if existing game is in progress
    # must end current game and reveal the number
    if res.numHash != 0:
        if res.revealed == FALSE:
            return ()
        end
    end

    # Verify that number is valid
    with_attr error_message("Supplied proof cannot be verified"):
        let (verified) = Verifier.initVerify()
        assert verified = TRUE
    end

    # Write hash of number to guess to blockchain
    let newGame = NumberStored(numHash=numHash, number=0, revealed=0)
    game.write(newGame)

    return ()
end

# Submit a guess
@external
func submit_guess{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}(numGuess : felt):
    let (guesser) = get_caller_address()
    guess.write(guesser, numGuess)
    return ()
end

# End and reveal the current game
@external
func reveal_game{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr,
}(number : felt, numHash : felt):
    let (res) = game.read()
    if res.revealed == TRUE:
        return ()
    end

    # Verify that revealed number is valid
    with_attr error_message("Supplied proof cannot be verified"):
        let (verified) = Verifier.revealVerify()
        assert verified = TRUE
    end

    # Reveal number on the blockchain
    let revealedGame = NumberStored(numHash=numHash, number=number, revealed=1)
    game.write(revealedGame)
    return ()
end