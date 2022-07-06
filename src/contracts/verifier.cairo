from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.bool import FALSE, TRUE

namespace Verifier:
    func initVerify{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr
    }(
        # _a : felt,              # uint256[2] memory _a,
        # _b : felt,              # uint256[2][2] memory _b,
        # _c : felt,              # uint256[2] memory _c,
        # _publicInputs : felt    # uint256[1] memory _publicInputs
    ) -> (res : felt):
        return (TRUE)
    end

    func revealVerify{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr
    }(
        # _a : felt,              # uint256[2] memory _a,
        # _b : felt,              # uint256[2][2] memory _b,
        # _c : felt,              # uint256[2] memory _c,
        # _publicInputs : felt    # uint256[1] memory _publicInputs
    ) -> (res : felt):
        return (TRUE)
    end
end