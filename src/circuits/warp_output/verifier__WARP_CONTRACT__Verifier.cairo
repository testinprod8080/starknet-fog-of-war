%lang starknet

from warplib.memory import (
    wm_alloc,
    wm_write_256,
    wm_read_id,
    wm_read_256,
    wm_write_felt,
    wm_index_static,
    wm_index_dyn,
    wm_dyn_array_length,
    wm_new,
)
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.dict import dict_write
from starkware.cairo.common.dict_access import DictAccess
from warplib.maths.external_input_check_ints import warp_external_input_check_int256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin
from warplib.maths.lt import warp_lt256
from warplib.maths.mul import warp_mul256
from warplib.maths.add import warp_add256
from warplib.maths.sub import warp_sub256
from warplib.maths.eq import warp_eq256
from starkware.cairo.common.default_dict import default_dict_new, default_dict_finalize
from warplib.maths.mod import warp_mod256
from warplib.maths.neq import warp_neq256

struct G2Point_b4eceac5:
    member __warp_usrid2_X : (Uint256, Uint256)
    member __warp_usrid3_Y : (Uint256, Uint256)
end

struct G1Point_e218a0db:
    member __warp_usrid0_X : Uint256
    member __warp_usrid1_Y : Uint256
end

struct VerifyingKey_1f72ac88:
    member __warp_usrid0_alfa1 : G1Point_e218a0db
    member __warp_usrid1_beta2 : G2Point_b4eceac5
    member __warp_usrid2_gamma2 : G2Point_b4eceac5
    member __warp_usrid3_delta2 : G2Point_b4eceac5
    member __warp_usrid4_IC : felt
end

struct Proof_7ebdce13:
    member __warp_usrid5_A : G1Point_e218a0db
    member __warp_usrid6_B : G2Point_b4eceac5
    member __warp_usrid7_C : G1Point_e218a0db
end

func WM0_s_arr{range_check_ptr, warp_memory : DictAccess*}(e0 : Uint256, e1 : Uint256) -> (
    loc : felt
):
    alloc_locals
    let (start) = wm_alloc(Uint256(0x4, 0x0))
    dict_write{dict_ptr=warp_memory}(start, e0.low)
    dict_write{dict_ptr=warp_memory}(start + 1, e0.high)
    dict_write{dict_ptr=warp_memory}(start + 2, e1.low)
    dict_write{dict_ptr=warp_memory}(start + 3, e1.high)
    return (start)
end

func WM1_s_arr{range_check_ptr, warp_memory : DictAccess*}(
    e0 : Uint256, e1 : Uint256, e2 : Uint256, e3 : Uint256
) -> (loc : felt):
    alloc_locals
    let (start) = wm_alloc(Uint256(0x8, 0x0))
    dict_write{dict_ptr=warp_memory}(start, e0.low)
    dict_write{dict_ptr=warp_memory}(start + 1, e0.high)
    dict_write{dict_ptr=warp_memory}(start + 2, e1.low)
    dict_write{dict_ptr=warp_memory}(start + 3, e1.high)
    dict_write{dict_ptr=warp_memory}(start + 4, e2.low)
    dict_write{dict_ptr=warp_memory}(start + 5, e2.high)
    dict_write{dict_ptr=warp_memory}(start + 6, e3.low)
    dict_write{dict_ptr=warp_memory}(start + 7, e3.high)
    return (start)
end

func WM2_s_arr{range_check_ptr, warp_memory : DictAccess*}(
    e0 : Uint256, e1 : Uint256, e2 : Uint256
) -> (loc : felt):
    alloc_locals
    let (start) = wm_alloc(Uint256(0x6, 0x0))
    dict_write{dict_ptr=warp_memory}(start, e0.low)
    dict_write{dict_ptr=warp_memory}(start + 1, e0.high)
    dict_write{dict_ptr=warp_memory}(start + 2, e1.low)
    dict_write{dict_ptr=warp_memory}(start + 3, e1.high)
    dict_write{dict_ptr=warp_memory}(start + 4, e2.low)
    dict_write{dict_ptr=warp_memory}(start + 5, e2.high)
    return (start)
end

func WM3_s_arr{range_check_ptr, warp_memory : DictAccess*}(e0 : Uint256) -> (loc : felt):
    alloc_locals
    let (start) = wm_alloc(Uint256(0x2, 0x0))
    dict_write{dict_ptr=warp_memory}(start, e0.low)
    dict_write{dict_ptr=warp_memory}(start + 1, e0.high)
    return (start)
end

func WM0_G1Point_e218a0db___warp_usrid0_X(loc : felt) -> (memberLoc : felt):
    return (loc)
end

func WM1_G1Point_e218a0db___warp_usrid1_Y(loc : felt) -> (memberLoc : felt):
    return (loc + 2)
end

func WM2_G2Point_b4eceac5___warp_usrid2_X(loc : felt) -> (memberLoc : felt):
    return (loc)
end

func WM3_G2Point_b4eceac5___warp_usrid3_Y(loc : felt) -> (memberLoc : felt):
    return (loc + 1)
end

func WM4_VerifyingKey_1f72ac88___warp_usrid4_IC(loc : felt) -> (memberLoc : felt):
    return (loc + 4)
end

func WM5_VerifyingKey_1f72ac88___warp_usrid0_alfa1(loc : felt) -> (memberLoc : felt):
    return (loc)
end

func WM6_VerifyingKey_1f72ac88___warp_usrid1_beta2(loc : felt) -> (memberLoc : felt):
    return (loc + 1)
end

func WM7_VerifyingKey_1f72ac88___warp_usrid2_gamma2(loc : felt) -> (memberLoc : felt):
    return (loc + 2)
end

func WM8_VerifyingKey_1f72ac88___warp_usrid3_delta2(loc : felt) -> (memberLoc : felt):
    return (loc + 3)
end

func WM9_Proof_7ebdce13___warp_usrid5_A(loc : felt) -> (memberLoc : felt):
    return (loc)
end

func WM10_Proof_7ebdce13___warp_usrid6_B(loc : felt) -> (memberLoc : felt):
    return (loc + 1)
end

func WM11_Proof_7ebdce13___warp_usrid7_C(loc : felt) -> (memberLoc : felt):
    return (loc + 2)
end

func WM0_struct_G1Point_e218a0db{range_check_ptr, warp_memory : DictAccess*}(
    __warp_usrid0_X : Uint256, __warp_usrid1_Y : Uint256
) -> (res):
    alloc_locals
    let (start) = wm_alloc(Uint256(0x4, 0x0))
    dict_write{dict_ptr=warp_memory}(start, __warp_usrid0_X.low)
    dict_write{dict_ptr=warp_memory}(start + 1, __warp_usrid0_X.high)
    dict_write{dict_ptr=warp_memory}(start + 2, __warp_usrid1_Y.low)
    dict_write{dict_ptr=warp_memory}(start + 3, __warp_usrid1_Y.high)
    return (start)
end

func WM1_struct_G2Point_b4eceac5{range_check_ptr, warp_memory : DictAccess*}(
    __warp_usrid2_X : felt, __warp_usrid3_Y : felt
) -> (res):
    alloc_locals
    let (start) = wm_alloc(Uint256(0x2, 0x0))
    dict_write{dict_ptr=warp_memory}(start, __warp_usrid2_X)
    dict_write{dict_ptr=warp_memory}(start + 1, __warp_usrid3_Y)
    return (start)
end

func WM2_struct_VerifyingKey_1f72ac88{range_check_ptr, warp_memory : DictAccess*}(
    __warp_usrid0_alfa1 : felt,
    __warp_usrid1_beta2 : felt,
    __warp_usrid2_gamma2 : felt,
    __warp_usrid3_delta2 : felt,
    __warp_usrid4_IC : felt,
) -> (res):
    alloc_locals
    let (start) = wm_alloc(Uint256(0x5, 0x0))
    dict_write{dict_ptr=warp_memory}(start, __warp_usrid0_alfa1)
    dict_write{dict_ptr=warp_memory}(start + 1, __warp_usrid1_beta2)
    dict_write{dict_ptr=warp_memory}(start + 2, __warp_usrid2_gamma2)
    dict_write{dict_ptr=warp_memory}(start + 3, __warp_usrid3_delta2)
    dict_write{dict_ptr=warp_memory}(start + 4, __warp_usrid4_IC)
    return (start)
end

func WM3_struct_Proof_7ebdce13{range_check_ptr, warp_memory : DictAccess*}(
    __warp_usrid5_A : felt, __warp_usrid6_B : felt, __warp_usrid7_C : felt
) -> (res):
    alloc_locals
    let (start) = wm_alloc(Uint256(0x3, 0x0))
    dict_write{dict_ptr=warp_memory}(start, __warp_usrid5_A)
    dict_write{dict_ptr=warp_memory}(start + 1, __warp_usrid6_B)
    dict_write{dict_ptr=warp_memory}(start + 2, __warp_usrid7_C)
    return (start)
end

func extern_input_check0{range_check_ptr : felt}(arg : (Uint256, Uint256)) -> ():
    alloc_locals
    warp_external_input_check_int256(arg[0])
    warp_external_input_check_int256(arg[1])
    return ()
end

func extern_input_check1{range_check_ptr : felt}(
    arg : ((Uint256, Uint256), (Uint256, Uint256))
) -> ():
    alloc_locals
    extern_input_check0(arg[0])
    extern_input_check0(arg[1])
    return ()
end

func cd_to_memory0{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(calldata : (Uint256, Uint256)) -> (mem_loc : felt):
    alloc_locals
    let (mem_start) = wm_alloc(Uint256(0x4, 0x0))
    dict_write{dict_ptr=warp_memory}(mem_start, calldata[0].low)
    dict_write{dict_ptr=warp_memory}(mem_start + 1, calldata[0].high)
    dict_write{dict_ptr=warp_memory}(mem_start + 1 * 2, calldata[1].low)
    dict_write{dict_ptr=warp_memory}(mem_start + 1 * 2 + 1, calldata[1].high)
    return (mem_start)
end

func cd_to_memory1{
    syscall_ptr : felt*,
    pedersen_ptr : HashBuiltin*,
    range_check_ptr : felt,
    warp_memory : DictAccess*,
}(calldata : ((Uint256, Uint256), (Uint256, Uint256))) -> (mem_loc : felt):
    alloc_locals
    let (mem_start) = wm_alloc(Uint256(0x2, 0x0))
    let cdElem = calldata[0]
    let (mElem) = cd_to_memory0(cdElem)
    dict_write{dict_ptr=warp_memory}(mem_start, mElem)
    let cdElem = calldata[1]
    let (mElem) = cd_to_memory0(cdElem)
    dict_write{dict_ptr=warp_memory}(mem_start + 1, mElem)
    return (mem_start)
end

# Contract Def Verifier

namespace Verifier:
    # Dynamic variables - Arrays and Maps

    # Static variables

    func __warp_while3{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(
        __warp_usrid25_i : Uint256,
        __warp_usrid22_elements : Uint256,
        __warp_usrid24_input : felt,
        __warp_usrid19_p1 : felt,
        __warp_usrid20_p2 : felt,
    ) -> (
        __warp_usrid25_i : Uint256,
        __warp_usrid22_elements : Uint256,
        __warp_usrid24_input : felt,
        __warp_usrid19_p1 : felt,
        __warp_usrid20_p2 : felt,
    ):
        alloc_locals

        let (__warp_se_0) = warp_lt256(__warp_usrid25_i, __warp_usrid22_elements)

        if __warp_se_0 != 0:
            let (__warp_se_1) = warp_mul256(__warp_usrid25_i, Uint256(low=6, high=0))

            let (__warp_se_2) = warp_add256(__warp_se_1, Uint256(low=0, high=0))

            let (__warp_se_3) = wm_index_dyn(
                __warp_usrid24_input, __warp_se_2, Uint256(low=2, high=0)
            )

            let (__warp_se_4) = wm_index_dyn(
                __warp_usrid19_p1, __warp_usrid25_i, Uint256(low=1, high=0)
            )

            let (__warp_se_5) = wm_read_id(__warp_se_4, Uint256(low=4, high=0))

            let (__warp_se_6) = WM0_G1Point_e218a0db___warp_usrid0_X(__warp_se_5)

            let (__warp_se_7) = wm_read_256(__warp_se_6)

            wm_write_256(__warp_se_3, __warp_se_7)

            let (__warp_se_8) = warp_mul256(__warp_usrid25_i, Uint256(low=6, high=0))

            let (__warp_se_9) = warp_add256(__warp_se_8, Uint256(low=1, high=0))

            let (__warp_se_10) = wm_index_dyn(
                __warp_usrid24_input, __warp_se_9, Uint256(low=2, high=0)
            )

            let (__warp_se_11) = wm_index_dyn(
                __warp_usrid19_p1, __warp_usrid25_i, Uint256(low=1, high=0)
            )

            let (__warp_se_12) = wm_read_id(__warp_se_11, Uint256(low=4, high=0))

            let (__warp_se_13) = WM1_G1Point_e218a0db___warp_usrid1_Y(__warp_se_12)

            let (__warp_se_14) = wm_read_256(__warp_se_13)

            wm_write_256(__warp_se_10, __warp_se_14)

            let (__warp_se_15) = warp_mul256(__warp_usrid25_i, Uint256(low=6, high=0))

            let (__warp_se_16) = warp_add256(__warp_se_15, Uint256(low=2, high=0))

            let (__warp_se_17) = wm_index_dyn(
                __warp_usrid24_input, __warp_se_16, Uint256(low=2, high=0)
            )

            let (__warp_se_18) = wm_index_dyn(
                __warp_usrid20_p2, __warp_usrid25_i, Uint256(low=1, high=0)
            )

            let (__warp_se_19) = wm_read_id(__warp_se_18, Uint256(low=2, high=0))

            let (__warp_se_20) = WM2_G2Point_b4eceac5___warp_usrid2_X(__warp_se_19)

            let (__warp_se_21) = wm_read_id(__warp_se_20, Uint256(low=4, high=0))

            let (__warp_se_22) = wm_index_static(
                __warp_se_21, Uint256(low=0, high=0), Uint256(low=2, high=0), Uint256(low=2, high=0)
            )

            let (__warp_se_23) = wm_read_256(__warp_se_22)

            wm_write_256(__warp_se_17, __warp_se_23)

            let (__warp_se_24) = warp_mul256(__warp_usrid25_i, Uint256(low=6, high=0))

            let (__warp_se_25) = warp_add256(__warp_se_24, Uint256(low=3, high=0))

            let (__warp_se_26) = wm_index_dyn(
                __warp_usrid24_input, __warp_se_25, Uint256(low=2, high=0)
            )

            let (__warp_se_27) = wm_index_dyn(
                __warp_usrid20_p2, __warp_usrid25_i, Uint256(low=1, high=0)
            )

            let (__warp_se_28) = wm_read_id(__warp_se_27, Uint256(low=2, high=0))

            let (__warp_se_29) = WM2_G2Point_b4eceac5___warp_usrid2_X(__warp_se_28)

            let (__warp_se_30) = wm_read_id(__warp_se_29, Uint256(low=4, high=0))

            let (__warp_se_31) = wm_index_static(
                __warp_se_30, Uint256(low=1, high=0), Uint256(low=2, high=0), Uint256(low=2, high=0)
            )

            let (__warp_se_32) = wm_read_256(__warp_se_31)

            wm_write_256(__warp_se_26, __warp_se_32)

            let (__warp_se_33) = warp_mul256(__warp_usrid25_i, Uint256(low=6, high=0))

            let (__warp_se_34) = warp_add256(__warp_se_33, Uint256(low=4, high=0))

            let (__warp_se_35) = wm_index_dyn(
                __warp_usrid24_input, __warp_se_34, Uint256(low=2, high=0)
            )

            let (__warp_se_36) = wm_index_dyn(
                __warp_usrid20_p2, __warp_usrid25_i, Uint256(low=1, high=0)
            )

            let (__warp_se_37) = wm_read_id(__warp_se_36, Uint256(low=2, high=0))

            let (__warp_se_38) = WM3_G2Point_b4eceac5___warp_usrid3_Y(__warp_se_37)

            let (__warp_se_39) = wm_read_id(__warp_se_38, Uint256(low=4, high=0))

            let (__warp_se_40) = wm_index_static(
                __warp_se_39, Uint256(low=0, high=0), Uint256(low=2, high=0), Uint256(low=2, high=0)
            )

            let (__warp_se_41) = wm_read_256(__warp_se_40)

            wm_write_256(__warp_se_35, __warp_se_41)

            let (__warp_se_42) = warp_mul256(__warp_usrid25_i, Uint256(low=6, high=0))

            let (__warp_se_43) = warp_add256(__warp_se_42, Uint256(low=5, high=0))

            let (__warp_se_44) = wm_index_dyn(
                __warp_usrid24_input, __warp_se_43, Uint256(low=2, high=0)
            )

            let (__warp_se_45) = wm_index_dyn(
                __warp_usrid20_p2, __warp_usrid25_i, Uint256(low=1, high=0)
            )

            let (__warp_se_46) = wm_read_id(__warp_se_45, Uint256(low=2, high=0))

            let (__warp_se_47) = WM3_G2Point_b4eceac5___warp_usrid3_Y(__warp_se_46)

            let (__warp_se_48) = wm_read_id(__warp_se_47, Uint256(low=4, high=0))

            let (__warp_se_49) = wm_index_static(
                __warp_se_48, Uint256(low=1, high=0), Uint256(low=2, high=0), Uint256(low=2, high=0)
            )

            let (__warp_se_50) = wm_read_256(__warp_se_49)

            wm_write_256(__warp_se_44, __warp_se_50)

            let (__warp_se_51) = warp_add256(__warp_usrid25_i, Uint256(low=1, high=0))

            let __warp_se_52 = __warp_se_51

            let __warp_usrid25_i = __warp_se_52

            warp_sub256(__warp_se_52, Uint256(low=1, high=0))

            let (
                __warp_usrid25_i, __warp_usrid22_elements, __warp_td_0, __warp_td_1, __warp_td_2
            ) = __warp_while3_part1(
                __warp_usrid25_i,
                __warp_usrid22_elements,
                __warp_usrid24_input,
                __warp_usrid19_p1,
                __warp_usrid20_p2,
            )

            let __warp_usrid24_input = __warp_td_0

            let __warp_usrid19_p1 = __warp_td_1

            let __warp_usrid20_p2 = __warp_td_2

            return (
                __warp_usrid25_i,
                __warp_usrid22_elements,
                __warp_usrid24_input,
                __warp_usrid19_p1,
                __warp_usrid20_p2,
            )
        else:
            let __warp_usrid25_i = __warp_usrid25_i

            let __warp_usrid22_elements = __warp_usrid22_elements

            let __warp_usrid24_input = __warp_usrid24_input

            let __warp_usrid19_p1 = __warp_usrid19_p1

            let __warp_usrid20_p2 = __warp_usrid20_p2

            return (
                __warp_usrid25_i,
                __warp_usrid22_elements,
                __warp_usrid24_input,
                __warp_usrid19_p1,
                __warp_usrid20_p2,
            )
        end
    end

    func __warp_while3_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(
        __warp_usrid25_i : Uint256,
        __warp_usrid22_elements : Uint256,
        __warp_usrid24_input : felt,
        __warp_usrid19_p1 : felt,
        __warp_usrid20_p2 : felt,
    ) -> (
        __warp_usrid25_i : Uint256,
        __warp_usrid22_elements : Uint256,
        __warp_usrid24_input : felt,
        __warp_usrid19_p1 : felt,
        __warp_usrid20_p2 : felt,
    ):
        alloc_locals

        let (
            __warp_usrid25_i, __warp_usrid22_elements, __warp_td_6, __warp_td_7, __warp_td_8
        ) = __warp_while3(
            __warp_usrid25_i,
            __warp_usrid22_elements,
            __warp_usrid24_input,
            __warp_usrid19_p1,
            __warp_usrid20_p2,
        )

        let __warp_usrid24_input = __warp_td_6

        let __warp_usrid19_p1 = __warp_td_7

        let __warp_usrid20_p2 = __warp_td_8

        return (
            __warp_usrid25_i,
            __warp_usrid22_elements,
            __warp_usrid24_input,
            __warp_usrid19_p1,
            __warp_usrid20_p2,
        )
    end

    func __warp_while2{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(
        __warp_usrid23_i : Uint256,
        __warp_usrid19_input_mem : felt,
        __warp_usrid22_inputValues : felt,
    ) -> (
        __warp_usrid23_i : Uint256,
        __warp_usrid19_input_mem : felt,
        __warp_usrid22_inputValues : felt,
    ):
        alloc_locals

        let (__warp_se_53) = warp_lt256(__warp_usrid23_i, Uint256(low=2, high=0))

        if __warp_se_53 != 0:
            let (__warp_se_54) = wm_index_dyn(
                __warp_usrid22_inputValues, __warp_usrid23_i, Uint256(low=2, high=0)
            )

            let (__warp_se_55) = wm_index_static(
                __warp_usrid19_input_mem,
                __warp_usrid23_i,
                Uint256(low=2, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_56) = wm_read_256(__warp_se_55)

            wm_write_256(__warp_se_54, __warp_se_56)

            let (__warp_se_57) = warp_add256(__warp_usrid23_i, Uint256(low=1, high=0))

            let __warp_se_58 = __warp_se_57

            let __warp_usrid23_i = __warp_se_58

            warp_sub256(__warp_se_58, Uint256(low=1, high=0))

            let (__warp_usrid23_i, __warp_td_9, __warp_td_10) = __warp_while2_part1(
                __warp_usrid23_i, __warp_usrid19_input_mem, __warp_usrid22_inputValues
            )

            let __warp_usrid19_input_mem = __warp_td_9

            let __warp_usrid22_inputValues = __warp_td_10

            return (__warp_usrid23_i, __warp_usrid19_input_mem, __warp_usrid22_inputValues)
        else:
            let __warp_usrid23_i = __warp_usrid23_i

            let __warp_usrid19_input_mem = __warp_usrid19_input_mem

            let __warp_usrid22_inputValues = __warp_usrid22_inputValues

            return (__warp_usrid23_i, __warp_usrid19_input_mem, __warp_usrid22_inputValues)
        end
    end

    func __warp_while2_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(
        __warp_usrid23_i : Uint256,
        __warp_usrid19_input_mem : felt,
        __warp_usrid22_inputValues : felt,
    ) -> (
        __warp_usrid23_i : Uint256,
        __warp_usrid19_input_mem : felt,
        __warp_usrid22_inputValues : felt,
    ):
        alloc_locals

        let (__warp_usrid23_i, __warp_td_13, __warp_td_14) = __warp_while2(
            __warp_usrid23_i, __warp_usrid19_input_mem, __warp_usrid22_inputValues
        )

        let __warp_usrid19_input_mem = __warp_td_13

        let __warp_usrid22_inputValues = __warp_td_14

        return (__warp_usrid23_i, __warp_usrid19_input_mem, __warp_usrid22_inputValues)
    end

    func __warp_while1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(
        __warp_usrid15_i : Uint256,
        __warp_usrid9_input : felt,
        __warp_usrid12_snark_scalar_field : Uint256,
        __warp_usrid14_vk_x : felt,
        __warp_usrid13_vk : felt,
    ) -> (
        __warp_usrid15_i : Uint256,
        __warp_usrid9_input : felt,
        __warp_usrid12_snark_scalar_field : Uint256,
        __warp_usrid14_vk_x : felt,
        __warp_usrid13_vk : felt,
    ):
        alloc_locals

        let (__warp_se_59) = wm_dyn_array_length(__warp_usrid9_input)

        let (__warp_se_60) = warp_lt256(__warp_usrid15_i, __warp_se_59)

        if __warp_se_60 != 0:
            let (__warp_se_61) = wm_index_dyn(
                __warp_usrid9_input, __warp_usrid15_i, Uint256(low=2, high=0)
            )

            let (__warp_se_62) = wm_read_256(__warp_se_61)

            let (__warp_se_63) = warp_lt256(__warp_se_62, __warp_usrid12_snark_scalar_field)

            with_attr error_message("verifier-gte-snark-scalar-field"):
                assert __warp_se_63 = 1
            end

            let (__warp_se_64) = WM4_VerifyingKey_1f72ac88___warp_usrid4_IC(__warp_usrid13_vk)

            let (__warp_se_65) = wm_read_id(__warp_se_64, Uint256(low=2, high=0))

            let (__warp_se_66) = warp_add256(__warp_usrid15_i, Uint256(low=1, high=0))

            let (__warp_se_67) = wm_index_dyn(__warp_se_65, __warp_se_66, Uint256(low=1, high=0))

            let (__warp_se_68) = wm_read_id(__warp_se_67, Uint256(low=4, high=0))

            let (__warp_se_69) = wm_index_dyn(
                __warp_usrid9_input, __warp_usrid15_i, Uint256(low=2, high=0)
            )

            let (__warp_se_70) = wm_read_256(__warp_se_69)

            let (__warp_se_71) = s1___warp_usrfn4_scalar_mul(__warp_se_68, __warp_se_70)

            let (__warp_se_72) = s1___warp_usrfn3_addition(__warp_usrid14_vk_x, __warp_se_71)

            let __warp_usrid14_vk_x = __warp_se_72

            let (__warp_se_73) = warp_add256(__warp_usrid15_i, Uint256(low=1, high=0))

            let __warp_se_74 = __warp_se_73

            let __warp_usrid15_i = __warp_se_74

            warp_sub256(__warp_se_74, Uint256(low=1, high=0))

            let (
                __warp_usrid15_i,
                __warp_td_15,
                __warp_usrid12_snark_scalar_field,
                __warp_td_16,
                __warp_td_17,
            ) = __warp_while1_part1(
                __warp_usrid15_i,
                __warp_usrid9_input,
                __warp_usrid12_snark_scalar_field,
                __warp_usrid14_vk_x,
                __warp_usrid13_vk,
            )

            let __warp_usrid9_input = __warp_td_15

            let __warp_usrid14_vk_x = __warp_td_16

            let __warp_usrid13_vk = __warp_td_17

            return (
                __warp_usrid15_i,
                __warp_usrid9_input,
                __warp_usrid12_snark_scalar_field,
                __warp_usrid14_vk_x,
                __warp_usrid13_vk,
            )
        else:
            let __warp_usrid15_i = __warp_usrid15_i

            let __warp_usrid9_input = __warp_usrid9_input

            let __warp_usrid12_snark_scalar_field = __warp_usrid12_snark_scalar_field

            let __warp_usrid14_vk_x = __warp_usrid14_vk_x

            let __warp_usrid13_vk = __warp_usrid13_vk

            return (
                __warp_usrid15_i,
                __warp_usrid9_input,
                __warp_usrid12_snark_scalar_field,
                __warp_usrid14_vk_x,
                __warp_usrid13_vk,
            )
        end
    end

    func __warp_while1_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(
        __warp_usrid15_i : Uint256,
        __warp_usrid9_input : felt,
        __warp_usrid12_snark_scalar_field : Uint256,
        __warp_usrid14_vk_x : felt,
        __warp_usrid13_vk : felt,
    ) -> (
        __warp_usrid15_i : Uint256,
        __warp_usrid9_input : felt,
        __warp_usrid12_snark_scalar_field : Uint256,
        __warp_usrid14_vk_x : felt,
        __warp_usrid13_vk : felt,
    ):
        alloc_locals

        let (
            __warp_usrid15_i,
            __warp_td_21,
            __warp_usrid12_snark_scalar_field,
            __warp_td_22,
            __warp_td_23,
        ) = __warp_while1(
            __warp_usrid15_i,
            __warp_usrid9_input,
            __warp_usrid12_snark_scalar_field,
            __warp_usrid14_vk_x,
            __warp_usrid13_vk,
        )

        let __warp_usrid9_input = __warp_td_21

        let __warp_usrid14_vk_x = __warp_td_22

        let __warp_usrid13_vk = __warp_td_23

        return (
            __warp_usrid15_i,
            __warp_usrid9_input,
            __warp_usrid12_snark_scalar_field,
            __warp_usrid14_vk_x,
            __warp_usrid13_vk,
        )
    end

    func __warp_usrfn0_verifyingKey{range_check_ptr : felt, warp_memory : DictAccess*}() -> (
        __warp_usrid8_vk : felt
    ):
        alloc_locals

        let (__warp_se_75) = WM0_struct_G1Point_e218a0db(
            Uint256(low=0, high=0), Uint256(low=0, high=0)
        )

        let (__warp_se_76) = WM0_s_arr(Uint256(low=0, high=0), Uint256(low=0, high=0))

        let (__warp_se_77) = WM0_s_arr(Uint256(low=0, high=0), Uint256(low=0, high=0))

        let (__warp_se_78) = WM1_struct_G2Point_b4eceac5(__warp_se_76, __warp_se_77)

        let (__warp_se_79) = WM0_s_arr(Uint256(low=0, high=0), Uint256(low=0, high=0))

        let (__warp_se_80) = WM0_s_arr(Uint256(low=0, high=0), Uint256(low=0, high=0))

        let (__warp_se_81) = WM1_struct_G2Point_b4eceac5(__warp_se_79, __warp_se_80)

        let (__warp_se_82) = WM0_s_arr(Uint256(low=0, high=0), Uint256(low=0, high=0))

        let (__warp_se_83) = WM0_s_arr(Uint256(low=0, high=0), Uint256(low=0, high=0))

        let (__warp_se_84) = WM1_struct_G2Point_b4eceac5(__warp_se_82, __warp_se_83)

        let (__warp_se_85) = wm_new(Uint256(low=0, high=0), Uint256(low=1, high=0))

        let (__warp_usrid8_vk) = WM2_struct_VerifyingKey_1f72ac88(
            __warp_se_75, __warp_se_78, __warp_se_81, __warp_se_84, __warp_se_85
        )

        let (__warp_se_86) = WM5_VerifyingKey_1f72ac88___warp_usrid0_alfa1(__warp_usrid8_vk)

        let (__warp_se_87) = WM0_struct_G1Point_e218a0db(
            Uint256(low=18470759655982269595587907794069579117, high=2406384731896598088958472742436633788),
            Uint256(low=320968536994319796948796822238815926875, high=48627630218683721079504899093507694873),
        )

        wm_write_felt(__warp_se_86, __warp_se_87)

        let (__warp_se_88) = WM6_VerifyingKey_1f72ac88___warp_usrid1_beta2(__warp_usrid8_vk)

        let (__warp_se_89) = WM0_s_arr(
            Uint256(low=255654440831339594296692473880196636063, high=33385085226706835579510899473820241472),
            Uint256(low=93243199323565547326454854048228210037, high=11732480947480592937336206938579414974),
        )

        let (__warp_se_90) = WM0_s_arr(
            Uint256(low=337299394216784911296970003264313059344, high=58670712405705829889435964004652717137),
            Uint256(low=181141754723938298017291244463213447407, high=34780109594701393703136509461884515395),
        )

        let (__warp_se_91) = WM1_struct_G2Point_b4eceac5(__warp_se_89, __warp_se_90)

        wm_write_felt(__warp_se_88, __warp_se_91)

        let (__warp_se_92) = WM7_VerifyingKey_1f72ac88___warp_usrid2_gamma2(__warp_usrid8_vk)

        let (__warp_se_93) = WM0_s_arr(
            Uint256(low=321228122123261106059779968529748660930, high=33970999254487337296367544696982691109),
            Uint256(low=137259073930222615551684094724674877165, high=31905993534909183259390360115767690361),
        )

        let (__warp_se_94) = WM0_s_arr(
            Uint256(low=250285283385540557223862098795094513499, high=11997000940139619428152682118654997397),
            Uint256(low=302824638645981006498739523792345398698, high=24966482982931995192542807552294600847),
        )

        let (__warp_se_95) = WM1_struct_G2Point_b4eceac5(__warp_se_93, __warp_se_94)

        wm_write_felt(__warp_se_92, __warp_se_95)

        let (__warp_se_96) = WM8_VerifyingKey_1f72ac88___warp_usrid3_delta2(__warp_usrid8_vk)

        let (__warp_se_97) = WM0_s_arr(
            Uint256(low=124868928132970115558726171248800235178, high=30043805006999776908722118294248240151),
            Uint256(low=50296609650079167582330390582436256921, high=2133948775356923139260308649406286012),
        )

        let (__warp_se_98) = WM0_s_arr(
            Uint256(low=35680202169161766763281970311148848385, high=58524934430877739556197099549774669657),
            Uint256(low=299725620751000334268718653812077019594, high=33114934564590796250832583349041458454),
        )

        let (__warp_se_99) = WM1_struct_G2Point_b4eceac5(__warp_se_97, __warp_se_98)

        wm_write_felt(__warp_se_96, __warp_se_99)

        let (__warp_se_100) = WM4_VerifyingKey_1f72ac88___warp_usrid4_IC(__warp_usrid8_vk)

        let (__warp_se_101) = wm_new(Uint256(low=3, high=0), Uint256(low=1, high=0))

        wm_write_felt(__warp_se_100, __warp_se_101)

        let (__warp_se_102) = WM4_VerifyingKey_1f72ac88___warp_usrid4_IC(__warp_usrid8_vk)

        let (__warp_se_103) = wm_read_id(__warp_se_102, Uint256(low=2, high=0))

        let (__warp_se_104) = wm_index_dyn(
            __warp_se_103, Uint256(low=0, high=0), Uint256(low=1, high=0)
        )

        let (__warp_se_105) = WM0_struct_G1Point_e218a0db(
            Uint256(low=305932090180193913254476660565115038541, high=59514504277405212092621816392458800331),
            Uint256(low=162191561132649689992719859563402392595, high=43460745038352366110634932083962315383),
        )

        wm_write_felt(__warp_se_104, __warp_se_105)

        let (__warp_se_106) = WM4_VerifyingKey_1f72ac88___warp_usrid4_IC(__warp_usrid8_vk)

        let (__warp_se_107) = wm_read_id(__warp_se_106, Uint256(low=2, high=0))

        let (__warp_se_108) = wm_index_dyn(
            __warp_se_107, Uint256(low=1, high=0), Uint256(low=1, high=0)
        )

        let (__warp_se_109) = WM0_struct_G1Point_e218a0db(
            Uint256(low=175530742523346845992084352292176274110, high=38653321373525931925121683503376127987),
            Uint256(low=18741128360376496529844324124995440103, high=53255416263160292846017543499524134948),
        )

        wm_write_felt(__warp_se_108, __warp_se_109)

        let (__warp_se_110) = WM4_VerifyingKey_1f72ac88___warp_usrid4_IC(__warp_usrid8_vk)

        let (__warp_se_111) = wm_read_id(__warp_se_110, Uint256(low=2, high=0))

        let (__warp_se_112) = wm_index_dyn(
            __warp_se_111, Uint256(low=2, high=0), Uint256(low=1, high=0)
        )

        let (__warp_se_113) = WM0_struct_G1Point_e218a0db(
            Uint256(low=177247744142490330373692566543547398792, high=45481018950955771791936640774138137697),
            Uint256(low=311946888507380495650035457248264555144, high=37769823724410227078740538545554414385),
        )

        wm_write_felt(__warp_se_112, __warp_se_113)

        return (__warp_usrid8_vk)
    end

    func __warp_usrfn1_verify{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(__warp_usrid9_input : felt, __warp_usrid10_proof : felt) -> (__warp_usrid11_ : Uint256):
        alloc_locals

        let __warp_usrid12_snark_scalar_field = Uint256(
            low=53438638232309528389504892708671455233, high=64323764613183177041862057485226039389
        )

        let (__warp_usrid13_vk) = __warp_usrfn0_verifyingKey()

        let (__warp_se_114) = wm_dyn_array_length(__warp_usrid9_input)

        let (__warp_se_115) = warp_add256(__warp_se_114, Uint256(low=1, high=0))

        let (__warp_se_116) = WM4_VerifyingKey_1f72ac88___warp_usrid4_IC(__warp_usrid13_vk)

        let (__warp_se_117) = wm_read_id(__warp_se_116, Uint256(low=2, high=0))

        let (__warp_se_118) = wm_dyn_array_length(__warp_se_117)

        let (__warp_se_119) = warp_eq256(__warp_se_115, __warp_se_118)

        with_attr error_message("verifier-bad-input"):
            assert __warp_se_119 = 1
        end

        let (__warp_usrid14_vk_x) = WM0_struct_G1Point_e218a0db(
            Uint256(low=0, high=0), Uint256(low=0, high=0)
        )

        let __warp_usrid15_i = Uint256(low=0, high=0)

        let (__warp_tv_0, __warp_td_24, __warp_tv_2, __warp_td_25, __warp_td_26) = __warp_while1(
            __warp_usrid15_i,
            __warp_usrid9_input,
            __warp_usrid12_snark_scalar_field,
            __warp_usrid14_vk_x,
            __warp_usrid13_vk,
        )

        let __warp_tv_1 = __warp_td_24

        let __warp_tv_3 = __warp_td_25

        let __warp_tv_4 = __warp_td_26

        let __warp_usrid13_vk = __warp_tv_4

        let __warp_usrid14_vk_x = __warp_tv_3

        let __warp_usrid12_snark_scalar_field = __warp_tv_2

        let __warp_usrid9_input = __warp_tv_1

        let __warp_usrid15_i = __warp_tv_0

        let (__warp_se_120) = WM4_VerifyingKey_1f72ac88___warp_usrid4_IC(__warp_usrid13_vk)

        let (__warp_se_121) = wm_read_id(__warp_se_120, Uint256(low=2, high=0))

        let (__warp_se_122) = wm_index_dyn(
            __warp_se_121, Uint256(low=0, high=0), Uint256(low=1, high=0)
        )

        let (__warp_se_123) = wm_read_id(__warp_se_122, Uint256(low=4, high=0))

        let (__warp_se_124) = s1___warp_usrfn3_addition(__warp_usrid14_vk_x, __warp_se_123)

        let __warp_usrid14_vk_x = __warp_se_124

        let (__warp_se_125) = WM9_Proof_7ebdce13___warp_usrid5_A(__warp_usrid10_proof)

        let (__warp_se_126) = wm_read_id(__warp_se_125, Uint256(low=4, high=0))

        let (__warp_se_127) = s1___warp_usrfn2_negate(__warp_se_126)

        let (__warp_se_128) = WM10_Proof_7ebdce13___warp_usrid6_B(__warp_usrid10_proof)

        let (__warp_se_129) = wm_read_id(__warp_se_128, Uint256(low=2, high=0))

        let (__warp_se_130) = WM5_VerifyingKey_1f72ac88___warp_usrid0_alfa1(__warp_usrid13_vk)

        let (__warp_se_131) = wm_read_id(__warp_se_130, Uint256(low=4, high=0))

        let (__warp_se_132) = WM6_VerifyingKey_1f72ac88___warp_usrid1_beta2(__warp_usrid13_vk)

        let (__warp_se_133) = wm_read_id(__warp_se_132, Uint256(low=2, high=0))

        let (__warp_se_134) = WM7_VerifyingKey_1f72ac88___warp_usrid2_gamma2(__warp_usrid13_vk)

        let (__warp_se_135) = wm_read_id(__warp_se_134, Uint256(low=2, high=0))

        let (__warp_se_136) = WM11_Proof_7ebdce13___warp_usrid7_C(__warp_usrid10_proof)

        let (__warp_se_137) = wm_read_id(__warp_se_136, Uint256(low=4, high=0))

        let (__warp_se_138) = WM8_VerifyingKey_1f72ac88___warp_usrid3_delta2(__warp_usrid13_vk)

        let (__warp_se_139) = wm_read_id(__warp_se_138, Uint256(low=2, high=0))

        let (__warp_se_140) = s1___warp_usrfn8_pairingProd4(
            __warp_se_127,
            __warp_se_129,
            __warp_se_131,
            __warp_se_133,
            __warp_usrid14_vk_x,
            __warp_se_135,
            __warp_se_137,
            __warp_se_139,
        )

        if 1 - __warp_se_140 != 0:
            return (Uint256(low=1, high=0))
        else:
            let (__warp_se_141) = __warp_usrfn1_verify_part1()

            return (__warp_se_141)
        end
    end

    func __warp_usrfn1_verify_part1() -> (__warp_usrid11_ : Uint256):
        alloc_locals

        return (Uint256(low=0, high=0))
    end

    # @return r  bool true if proof is valid
    @view
    func verifyProof_f5c9d69e{
        syscall_ptr : felt*,
        pedersen_ptr : HashBuiltin*,
        range_check_ptr : felt,
        bitwise_ptr : BitwiseBuiltin*,
    }(
        __warp_usrid16_a : (Uint256, Uint256),
        __warp_usrid17_b : ((Uint256, Uint256), (Uint256, Uint256)),
        __warp_usrid18_c : (Uint256, Uint256),
        __warp_usrid19_input : (Uint256, Uint256),
    ) -> (__warp_usrid20_r : felt):
        alloc_locals
        let (local warp_memory : DictAccess*) = default_dict_new(0)
        local warp_memory_start : DictAccess* = warp_memory
        dict_write{dict_ptr=warp_memory}(0, 1)
        with warp_memory:
            extern_input_check0(__warp_usrid19_input)

            extern_input_check0(__warp_usrid18_c)

            extern_input_check1(__warp_usrid17_b)

            extern_input_check0(__warp_usrid16_a)

            let (__warp_usrid19_input_mem) = cd_to_memory0(__warp_usrid19_input)

            let (__warp_usrid18_c_mem) = cd_to_memory0(__warp_usrid18_c)

            let (__warp_usrid17_b_mem) = cd_to_memory1(__warp_usrid17_b)

            let (__warp_usrid16_a_mem) = cd_to_memory0(__warp_usrid16_a)

            let (__warp_se_142) = WM0_struct_G1Point_e218a0db(
                Uint256(low=0, high=0), Uint256(low=0, high=0)
            )

            let (__warp_se_143) = WM0_s_arr(Uint256(low=0, high=0), Uint256(low=0, high=0))

            let (__warp_se_144) = WM0_s_arr(Uint256(low=0, high=0), Uint256(low=0, high=0))

            let (__warp_se_145) = WM1_struct_G2Point_b4eceac5(__warp_se_143, __warp_se_144)

            let (__warp_se_146) = WM0_struct_G1Point_e218a0db(
                Uint256(low=0, high=0), Uint256(low=0, high=0)
            )

            let (__warp_usrid21_proof) = WM3_struct_Proof_7ebdce13(
                __warp_se_142, __warp_se_145, __warp_se_146
            )

            let (__warp_se_147) = WM9_Proof_7ebdce13___warp_usrid5_A(__warp_usrid21_proof)

            let (__warp_se_148) = wm_index_static(
                __warp_usrid16_a_mem,
                Uint256(low=0, high=0),
                Uint256(low=2, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_149) = wm_read_256(__warp_se_148)

            let (__warp_se_150) = wm_index_static(
                __warp_usrid16_a_mem,
                Uint256(low=1, high=0),
                Uint256(low=2, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_151) = wm_read_256(__warp_se_150)

            let (__warp_se_152) = WM0_struct_G1Point_e218a0db(__warp_se_149, __warp_se_151)

            wm_write_felt(__warp_se_147, __warp_se_152)

            let (__warp_se_153) = WM10_Proof_7ebdce13___warp_usrid6_B(__warp_usrid21_proof)

            let (__warp_se_154) = wm_index_static(
                __warp_usrid17_b_mem,
                Uint256(low=0, high=0),
                Uint256(low=1, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_155) = wm_read_id(__warp_se_154, Uint256(low=4, high=0))

            let (__warp_se_156) = wm_index_static(
                __warp_se_155,
                Uint256(low=0, high=0),
                Uint256(low=2, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_157) = wm_read_256(__warp_se_156)

            let (__warp_se_158) = wm_index_static(
                __warp_usrid17_b_mem,
                Uint256(low=0, high=0),
                Uint256(low=1, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_159) = wm_read_id(__warp_se_158, Uint256(low=4, high=0))

            let (__warp_se_160) = wm_index_static(
                __warp_se_159,
                Uint256(low=1, high=0),
                Uint256(low=2, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_161) = wm_read_256(__warp_se_160)

            let (__warp_se_162) = WM0_s_arr(__warp_se_157, __warp_se_161)

            let (__warp_se_163) = wm_index_static(
                __warp_usrid17_b_mem,
                Uint256(low=1, high=0),
                Uint256(low=1, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_164) = wm_read_id(__warp_se_163, Uint256(low=4, high=0))

            let (__warp_se_165) = wm_index_static(
                __warp_se_164,
                Uint256(low=0, high=0),
                Uint256(low=2, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_166) = wm_read_256(__warp_se_165)

            let (__warp_se_167) = wm_index_static(
                __warp_usrid17_b_mem,
                Uint256(low=1, high=0),
                Uint256(low=1, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_168) = wm_read_id(__warp_se_167, Uint256(low=4, high=0))

            let (__warp_se_169) = wm_index_static(
                __warp_se_168,
                Uint256(low=1, high=0),
                Uint256(low=2, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_170) = wm_read_256(__warp_se_169)

            let (__warp_se_171) = WM0_s_arr(__warp_se_166, __warp_se_170)

            let (__warp_se_172) = WM1_struct_G2Point_b4eceac5(__warp_se_162, __warp_se_171)

            wm_write_felt(__warp_se_153, __warp_se_172)

            let (__warp_se_173) = WM11_Proof_7ebdce13___warp_usrid7_C(__warp_usrid21_proof)

            let (__warp_se_174) = wm_index_static(
                __warp_usrid18_c_mem,
                Uint256(low=0, high=0),
                Uint256(low=2, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_175) = wm_read_256(__warp_se_174)

            let (__warp_se_176) = wm_index_static(
                __warp_usrid18_c_mem,
                Uint256(low=1, high=0),
                Uint256(low=2, high=0),
                Uint256(low=2, high=0),
            )

            let (__warp_se_177) = wm_read_256(__warp_se_176)

            let (__warp_se_178) = WM0_struct_G1Point_e218a0db(__warp_se_175, __warp_se_177)

            wm_write_felt(__warp_se_173, __warp_se_178)

            let (__warp_usrid22_inputValues) = wm_new(
                Uint256(low=2, high=0), Uint256(low=2, high=0)
            )

            let __warp_usrid23_i = Uint256(low=0, high=0)

            let (__warp_tv_5, __warp_td_27, __warp_td_28) = __warp_while2(
                __warp_usrid23_i, __warp_usrid19_input_mem, __warp_usrid22_inputValues
            )

            let __warp_tv_6 = __warp_td_27

            let __warp_tv_7 = __warp_td_28

            let __warp_usrid22_inputValues = __warp_tv_7

            let __warp_usrid19_input_mem = __warp_tv_6

            let __warp_usrid23_i = __warp_tv_5

            let (__warp_se_179) = __warp_usrfn1_verify(
                __warp_usrid22_inputValues, __warp_usrid21_proof
            )

            let (__warp_se_180) = warp_eq256(__warp_se_179, Uint256(low=0, high=0))

            if __warp_se_180 != 0:
                default_dict_finalize(warp_memory_start, warp_memory, 0)

                return (1)
            else:
                default_dict_finalize(warp_memory_start, warp_memory, 0)

                return (0)
            end
        end
    end

    func __warp_constructor_0() -> ():
        alloc_locals

        return ()
    end

    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}():
        alloc_locals

        __warp_constructor_0()

        return ()
    end

    # @return the generator of G1
    func s1___warp_usrfn0_P1{range_check_ptr : felt, warp_memory : DictAccess*}() -> (
        __warp_usrid4_ : felt
    ):
        alloc_locals

        let (__warp_se_181) = WM0_struct_G1Point_e218a0db(
            Uint256(low=1, high=0), Uint256(low=2, high=0)
        )

        return (__warp_se_181)
    end

    # @return the generator of G2
    func s1___warp_usrfn1_P2{range_check_ptr : felt, warp_memory : DictAccess*}() -> (
        __warp_usrid5_ : felt
    ):
        alloc_locals

        let (__warp_se_182) = WM0_s_arr(
            Uint256(low=321228122123261106059779968529748660930, high=33970999254487337296367544696982691109),
            Uint256(low=137259073930222615551684094724674877165, high=31905993534909183259390360115767690361),
        )

        let (__warp_se_183) = WM0_s_arr(
            Uint256(low=250285283385540557223862098795094513499, high=11997000940139619428152682118654997397),
            Uint256(low=302824638645981006498739523792345398698, high=24966482982931995192542807552294600847),
        )

        let (__warp_se_184) = WM1_struct_G2Point_b4eceac5(__warp_se_182, __warp_se_183)

        return (__warp_se_184)
    end

    func _conditional0{range_check_ptr : felt, warp_memory : DictAccess*}(
        __warp_usrid6_p : felt
    ) -> (ret_conditional0 : felt, __warp_usrid6_p : felt):
        alloc_locals

        let (__warp_se_185) = WM0_G1Point_e218a0db___warp_usrid0_X(__warp_usrid6_p)

        let (__warp_se_186) = wm_read_256(__warp_se_185)

        let (__warp_se_187) = warp_eq256(__warp_se_186, Uint256(low=0, high=0))

        if __warp_se_187 != 0:
            let (__warp_se_188) = WM1_G1Point_e218a0db___warp_usrid1_Y(__warp_usrid6_p)

            let (__warp_se_189) = wm_read_256(__warp_se_188)

            let (__warp_se_190) = warp_eq256(__warp_se_189, Uint256(low=0, high=0))

            let ret_conditional0 = __warp_se_190

            return (ret_conditional0, __warp_usrid6_p)
        else:
            let ret_conditional0 = 0

            return (ret_conditional0, __warp_usrid6_p)
        end
    end

    # @return r the negation of p, i.e. p.addition(p.negate()) should be zero.
    func s1___warp_usrfn2_negate{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(__warp_usrid6_p : felt) -> (__warp_usrid7_r : felt):
        alloc_locals

        let __warp_usrid8_q = Uint256(
            low=201385395114098847380338600778089168199, high=64323764613183177041862057485226039389
        )

        let ret_conditional1 = 0

        let (ret_conditional1, __warp_usrid6_p) = _conditional0(__warp_usrid6_p)

        if ret_conditional1 != 0:
            let (__warp_se_191) = WM0_struct_G1Point_e218a0db(
                Uint256(low=0, high=0), Uint256(low=0, high=0)
            )

            return (__warp_se_191)
        else:
            let (__warp_se_192) = s1___warp_usrfn2_negate_part1(__warp_usrid6_p, __warp_usrid8_q)

            return (__warp_se_192)
        end
    end

    func s1___warp_usrfn2_negate_part1{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(__warp_usrid6_p : felt, __warp_usrid8_q : Uint256) -> (__warp_usrid7_r : felt):
        alloc_locals

        let (__warp_se_193) = WM0_G1Point_e218a0db___warp_usrid0_X(__warp_usrid6_p)

        let (__warp_se_194) = wm_read_256(__warp_se_193)

        let (__warp_se_195) = WM1_G1Point_e218a0db___warp_usrid1_Y(__warp_usrid6_p)

        let (__warp_se_196) = wm_read_256(__warp_se_195)

        let (__warp_se_197) = warp_mod256(__warp_se_196, __warp_usrid8_q)

        let (__warp_se_198) = warp_sub256(__warp_usrid8_q, __warp_se_197)

        let (__warp_se_199) = WM0_struct_G1Point_e218a0db(__warp_se_194, __warp_se_198)

        return (__warp_se_199)
    end

    # @return r the sum of two points of G1
    func s1___warp_usrfn3_addition{range_check_ptr : felt, warp_memory : DictAccess*}(
        __warp_usrid9_p1 : felt, __warp_usrid10_p2 : felt
    ) -> (__warp_usrid11_r : felt):
        alloc_locals

        let (__warp_usrid11_r) = WM0_struct_G1Point_e218a0db(
            Uint256(low=0, high=0), Uint256(low=0, high=0)
        )

        let (__warp_usrid12_input) = WM1_s_arr(
            Uint256(low=0, high=0),
            Uint256(low=0, high=0),
            Uint256(low=0, high=0),
            Uint256(low=0, high=0),
        )

        let (__warp_se_200) = wm_index_static(
            __warp_usrid12_input,
            Uint256(low=0, high=0),
            Uint256(low=2, high=0),
            Uint256(low=4, high=0),
        )

        let (__warp_se_201) = WM0_G1Point_e218a0db___warp_usrid0_X(__warp_usrid9_p1)

        let (__warp_se_202) = wm_read_256(__warp_se_201)

        wm_write_256(__warp_se_200, __warp_se_202)

        let (__warp_se_203) = wm_index_static(
            __warp_usrid12_input,
            Uint256(low=1, high=0),
            Uint256(low=2, high=0),
            Uint256(low=4, high=0),
        )

        let (__warp_se_204) = WM1_G1Point_e218a0db___warp_usrid1_Y(__warp_usrid9_p1)

        let (__warp_se_205) = wm_read_256(__warp_se_204)

        wm_write_256(__warp_se_203, __warp_se_205)

        let (__warp_se_206) = wm_index_static(
            __warp_usrid12_input,
            Uint256(low=2, high=0),
            Uint256(low=2, high=0),
            Uint256(low=4, high=0),
        )

        let (__warp_se_207) = WM0_G1Point_e218a0db___warp_usrid0_X(__warp_usrid10_p2)

        let (__warp_se_208) = wm_read_256(__warp_se_207)

        wm_write_256(__warp_se_206, __warp_se_208)

        let (__warp_se_209) = wm_index_static(
            __warp_usrid12_input,
            Uint256(low=3, high=0),
            Uint256(low=2, high=0),
            Uint256(low=4, high=0),
        )

        let (__warp_se_210) = WM1_G1Point_e218a0db___warp_usrid1_Y(__warp_usrid10_p2)

        let (__warp_se_211) = wm_read_256(__warp_se_210)

        wm_write_256(__warp_se_209, __warp_se_211)

        let __warp_usrid13_success = 0

        with_attr error_message("pairing-add-failed"):
            assert __warp_usrid13_success = 1
        end

        return (__warp_usrid11_r)
    end

    # @return r the product of a point on G1 and a scalar, i.e.
    # p == p.scalar_mul(1) and p.addition(p) == p.scalar_mul(2) for all points p.
    func s1___warp_usrfn4_scalar_mul{range_check_ptr : felt, warp_memory : DictAccess*}(
        __warp_usrid14_p : felt, __warp_usrid15_s : Uint256
    ) -> (__warp_usrid16_r : felt):
        alloc_locals

        let (__warp_usrid16_r) = WM0_struct_G1Point_e218a0db(
            Uint256(low=0, high=0), Uint256(low=0, high=0)
        )

        let (__warp_usrid17_input) = WM2_s_arr(
            Uint256(low=0, high=0), Uint256(low=0, high=0), Uint256(low=0, high=0)
        )

        let (__warp_se_212) = wm_index_static(
            __warp_usrid17_input,
            Uint256(low=0, high=0),
            Uint256(low=2, high=0),
            Uint256(low=3, high=0),
        )

        let (__warp_se_213) = WM0_G1Point_e218a0db___warp_usrid0_X(__warp_usrid14_p)

        let (__warp_se_214) = wm_read_256(__warp_se_213)

        wm_write_256(__warp_se_212, __warp_se_214)

        let (__warp_se_215) = wm_index_static(
            __warp_usrid17_input,
            Uint256(low=1, high=0),
            Uint256(low=2, high=0),
            Uint256(low=3, high=0),
        )

        let (__warp_se_216) = WM1_G1Point_e218a0db___warp_usrid1_Y(__warp_usrid14_p)

        let (__warp_se_217) = wm_read_256(__warp_se_216)

        wm_write_256(__warp_se_215, __warp_se_217)

        let (__warp_se_218) = wm_index_static(
            __warp_usrid17_input,
            Uint256(low=2, high=0),
            Uint256(low=2, high=0),
            Uint256(low=3, high=0),
        )

        wm_write_256(__warp_se_218, __warp_usrid15_s)

        let __warp_usrid18_success = 0

        with_attr error_message("pairing-mul-failed"):
            assert __warp_usrid18_success = 1
        end

        return (__warp_usrid16_r)
    end

    # @return the result of computing the pairing check
    # e(p1[0], p2[0]) *  .... * e(p1[n], p2[n]) == 1
    # For example pairing([P1(), P1().negate()], [P2(), P2()]) should
    # return true.
    func s1___warp_usrfn5_pairing{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(__warp_usrid19_p1 : felt, __warp_usrid20_p2 : felt) -> (__warp_usrid21_ : felt):
        alloc_locals

        let (__warp_se_219) = wm_dyn_array_length(__warp_usrid19_p1)

        let (__warp_se_220) = wm_dyn_array_length(__warp_usrid20_p2)

        let (__warp_se_221) = warp_eq256(__warp_se_219, __warp_se_220)

        with_attr error_message("pairing-lengths-failed"):
            assert __warp_se_221 = 1
        end

        let (__warp_usrid22_elements) = wm_dyn_array_length(__warp_usrid19_p1)

        let (__warp_usrid23_inputSize) = warp_mul256(
            __warp_usrid22_elements, Uint256(low=6, high=0)
        )

        let (__warp_usrid24_input) = wm_new(__warp_usrid23_inputSize, Uint256(low=2, high=0))

        let __warp_usrid25_i = Uint256(low=0, high=0)

        let (__warp_tv_8, __warp_tv_9, __warp_td_29, __warp_td_30, __warp_td_31) = __warp_while3(
            __warp_usrid25_i,
            __warp_usrid22_elements,
            __warp_usrid24_input,
            __warp_usrid19_p1,
            __warp_usrid20_p2,
        )

        let __warp_tv_10 = __warp_td_29

        let __warp_tv_11 = __warp_td_30

        let __warp_tv_12 = __warp_td_31

        let __warp_usrid20_p2 = __warp_tv_12

        let __warp_usrid19_p1 = __warp_tv_11

        let __warp_usrid24_input = __warp_tv_10

        let __warp_usrid22_elements = __warp_tv_9

        let __warp_usrid25_i = __warp_tv_8

        let (__warp_usrid26_out) = WM3_s_arr(Uint256(low=0, high=0))

        let __warp_usrid27_success = 0

        with_attr error_message("pairing-opcode-failed"):
            assert __warp_usrid27_success = 1
        end

        let (__warp_se_222) = wm_index_static(
            __warp_usrid26_out,
            Uint256(low=0, high=0),
            Uint256(low=2, high=0),
            Uint256(low=1, high=0),
        )

        let (__warp_se_223) = wm_read_256(__warp_se_222)

        let (__warp_se_224) = warp_neq256(__warp_se_223, Uint256(low=0, high=0))

        return (__warp_se_224)
    end

    # Convenience method for a pairing check for two pairs.
    func s1___warp_usrfn6_pairingProd2{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(
        __warp_usrid28_a1 : felt,
        __warp_usrid29_a2 : felt,
        __warp_usrid30_b1 : felt,
        __warp_usrid31_b2 : felt,
    ) -> (__warp_usrid32_ : felt):
        alloc_locals

        let (__warp_usrid33_p1) = wm_new(Uint256(low=2, high=0), Uint256(low=1, high=0))

        let (__warp_usrid34_p2) = wm_new(Uint256(low=2, high=0), Uint256(low=1, high=0))

        let (__warp_se_225) = wm_index_dyn(
            __warp_usrid33_p1, Uint256(low=0, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_225, __warp_usrid28_a1)

        let (__warp_se_226) = wm_index_dyn(
            __warp_usrid33_p1, Uint256(low=1, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_226, __warp_usrid30_b1)

        let (__warp_se_227) = wm_index_dyn(
            __warp_usrid34_p2, Uint256(low=0, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_227, __warp_usrid29_a2)

        let (__warp_se_228) = wm_index_dyn(
            __warp_usrid34_p2, Uint256(low=1, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_228, __warp_usrid31_b2)

        let (__warp_se_229) = s1___warp_usrfn5_pairing(__warp_usrid33_p1, __warp_usrid34_p2)

        return (__warp_se_229)
    end

    # Convenience method for a pairing check for three pairs.
    func s1___warp_usrfn7_pairingProd3{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(
        __warp_usrid35_a1 : felt,
        __warp_usrid36_a2 : felt,
        __warp_usrid37_b1 : felt,
        __warp_usrid38_b2 : felt,
        __warp_usrid39_c1 : felt,
        __warp_usrid40_c2 : felt,
    ) -> (__warp_usrid41_ : felt):
        alloc_locals

        let (__warp_usrid42_p1) = wm_new(Uint256(low=3, high=0), Uint256(low=1, high=0))

        let (__warp_usrid43_p2) = wm_new(Uint256(low=3, high=0), Uint256(low=1, high=0))

        let (__warp_se_230) = wm_index_dyn(
            __warp_usrid42_p1, Uint256(low=0, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_230, __warp_usrid35_a1)

        let (__warp_se_231) = wm_index_dyn(
            __warp_usrid42_p1, Uint256(low=1, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_231, __warp_usrid37_b1)

        let (__warp_se_232) = wm_index_dyn(
            __warp_usrid42_p1, Uint256(low=2, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_232, __warp_usrid39_c1)

        let (__warp_se_233) = wm_index_dyn(
            __warp_usrid43_p2, Uint256(low=0, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_233, __warp_usrid36_a2)

        let (__warp_se_234) = wm_index_dyn(
            __warp_usrid43_p2, Uint256(low=1, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_234, __warp_usrid38_b2)

        let (__warp_se_235) = wm_index_dyn(
            __warp_usrid43_p2, Uint256(low=2, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_235, __warp_usrid40_c2)

        let (__warp_se_236) = s1___warp_usrfn5_pairing(__warp_usrid42_p1, __warp_usrid43_p2)

        return (__warp_se_236)
    end

    # Convenience method for a pairing check for four pairs.
    func s1___warp_usrfn8_pairingProd4{
        range_check_ptr : felt, bitwise_ptr : BitwiseBuiltin*, warp_memory : DictAccess*
    }(
        __warp_usrid44_a1 : felt,
        __warp_usrid45_a2 : felt,
        __warp_usrid46_b1 : felt,
        __warp_usrid47_b2 : felt,
        __warp_usrid48_c1 : felt,
        __warp_usrid49_c2 : felt,
        __warp_usrid50_d1 : felt,
        __warp_usrid51_d2 : felt,
    ) -> (__warp_usrid52_ : felt):
        alloc_locals

        let (__warp_usrid53_p1) = wm_new(Uint256(low=4, high=0), Uint256(low=1, high=0))

        let (__warp_usrid54_p2) = wm_new(Uint256(low=4, high=0), Uint256(low=1, high=0))

        let (__warp_se_237) = wm_index_dyn(
            __warp_usrid53_p1, Uint256(low=0, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_237, __warp_usrid44_a1)

        let (__warp_se_238) = wm_index_dyn(
            __warp_usrid53_p1, Uint256(low=1, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_238, __warp_usrid46_b1)

        let (__warp_se_239) = wm_index_dyn(
            __warp_usrid53_p1, Uint256(low=2, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_239, __warp_usrid48_c1)

        let (__warp_se_240) = wm_index_dyn(
            __warp_usrid53_p1, Uint256(low=3, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_240, __warp_usrid50_d1)

        let (__warp_se_241) = wm_index_dyn(
            __warp_usrid54_p2, Uint256(low=0, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_241, __warp_usrid45_a2)

        let (__warp_se_242) = wm_index_dyn(
            __warp_usrid54_p2, Uint256(low=1, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_242, __warp_usrid47_b2)

        let (__warp_se_243) = wm_index_dyn(
            __warp_usrid54_p2, Uint256(low=2, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_243, __warp_usrid49_c2)

        let (__warp_se_244) = wm_index_dyn(
            __warp_usrid54_p2, Uint256(low=3, high=0), Uint256(low=1, high=0)
        )

        wm_write_felt(__warp_se_244, __warp_usrid51_d2)

        let (__warp_se_245) = s1___warp_usrfn5_pairing(__warp_usrid53_p1, __warp_usrid54_p2)

        return (__warp_se_245)
    end
end

# Original soldity abi: ["verifyProof(uint256[2],uint256[2][2],uint256[2],uint256[2])"]
