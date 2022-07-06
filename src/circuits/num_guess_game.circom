pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";
include "../../node_modules/circomlib/circuits/mimcsponge.circom";

template hashNumber() {
  signal input number;
  signal input hashKey;

  signal output out;

  component mimc = MiMCSponge(2, 220, 1);
  mimc.ins[0] <== number;
  mimc.ins[1] <== hashKey;

  mimc.k <== 0;

  out <== mimc.outs[0];
}

template SetNumberToGuess() {
  signal input number;
  signal input hashKey;
  signal input maxValue;

  signal output out;

  // check whether number less than or equal to X
  component l1 = LessEqThan(32);
  l1.in[0] <== number;
  l1.in[1] <== maxValue;

  l1.out === 1;

  // hash attribute
  component cHash = hashNumber();
  cHash.number <== number;
  cHash.hashKey <== hashKey;

  out <== cHash.out;
}

template RevealNumber() {
  signal input number;
  signal input hashKey;

  signal output out;

  // hash attribute
  component cHash = hashNumber();
  cHash.number <== number;
  cHash.hashKey <== hashKey;

  out <== cHash.out;
}

component main {public [maxValue]} = SetNumberToGuess();