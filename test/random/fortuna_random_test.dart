// Copyright (c) 2013-present, Iván Zaera Avellón - izaera@gmail.com

// This library is dually licensed under LGPL 3 and MPL 2.0. See file LICENSE for more information.

// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of
// the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0/.

library cipher.test.random.fortuna_random_test;

import "dart:typed_data";

import "package:cipher/cipher.dart";

import "package:unittest/unittest.dart";

void main() {

  initCipher();

  group( "Fortuna:", () {

    final rnd = new SecureRandom("Fortuna");

    test( "${rnd.algorithmName}", () {

      final key = new Uint8List(32);
      final keyParam = new KeyParameter(key);

      rnd.seed(keyParam);

      final firstExpected = [83, 15, 138, 251, 199, 69, 54, 185, 169, 99, 180, 241, 196, 203, 115, 139, 206];
      var firstBytes = rnd.nextBytes(17);
      expect( firstBytes, firstExpected );

      final lastExpected = [227, 7, 53, 32, 144, 169, 73, 217, 239, 226, 233, 123, 220, 80, 210, 0, 229];
      var lastBytes = rnd.nextBytes(17);
      expect( lastBytes, lastExpected );

    });

  });
}
