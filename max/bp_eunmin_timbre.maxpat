{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 8,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      60,
      60,
      1180,
      720
    ],
    "gridsize": [
      15,
      15
    ],
    "boxes": [
      {
        "box": {
          "id": "c0",
          "maxclass": "comment",
          "patching_rect": [
            10,
            10,
            900,
            20
          ],
          "text": "bp_eunmin_timbre | register-based additive/subtractive treatment from shared pitch; supports all 7 slots via shared bus",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "rin",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            45,
            140,
            22
          ],
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "receive~ sc_star_mix"
        }
      },
      {
        "box": {
          "id": "rp",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            45,
            130,
            22
          ],
          "text": "r sc_analysis_pitch",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "low",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            85,
            190,
            22
          ],
          "text": "if $f1 <= 150 then 1 else 0",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "mid",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            120,
            280,
            22
          ],
          "text": "if $f1 > 150 && $f1 <= 250 then 1 else 0",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "hi",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            155,
            190,
            22
          ],
          "text": "if $f1 > 250 then 1 else 0",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "lp",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            90,
            110,
            22
          ],
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "lores~ 900 0.5"
        }
      },
      {
        "box": {
          "id": "hp",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            130,
            105,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "onepole~ 0.65"
        }
      },
      {
        "box": {
          "id": "harm",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            170,
            85,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "cycle~ 660"
        }
      },
      {
        "box": {
          "id": "hg",
          "maxclass": "newobj",
          "patching_rect": [
            110,
            170,
            75,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.025"
        }
      },
      {
        "box": {
          "id": "sum",
          "maxclass": "newobj",
          "patching_rect": [
            60,
            220,
            40,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "gain",
          "maxclass": "newobj",
          "patching_rect": [
            60,
            260,
            75,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.18"
        }
      },
      {
        "box": {
          "id": "send",
          "maxclass": "newobj",
          "patching_rect": [
            60,
            300,
            150,
            22
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "text": "send~ sc_eunmin_mix"
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            10,
            345,
            820,
            20
          ],
          "text": "Uses shared pitch analysis; harmonic branch follows clipped source pitch and is gated by real star audio activity.",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "amp",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            95,
            95,
            22
          ],
          "text": "peakamp~ 50",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ]
        }
      },
      {
        "box": {
          "id": "active",
          "maxclass": "newobj",
          "patching_rect": [
            640,
            95,
            65,
            22
          ],
          "text": "> 0.01",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "hgate",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            155,
            55,
            22
          ],
          "text": "*~ 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "hclip",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            35,
            105,
            22
          ],
          "text": "clip 80. 1000.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "hmul",
          "maxclass": "newobj",
          "patching_rect": [
            640,
            35,
            45,
            22
          ],
          "text": "* 2.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "rin",
            0
          ],
          "destination": [
            "lp",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rin",
            0
          ],
          "destination": [
            "hp",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "lp",
            0
          ],
          "destination": [
            "sum",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "hg",
            0
          ],
          "destination": [
            "sum",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sum",
            0
          ],
          "destination": [
            "gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gain",
            0
          ],
          "destination": [
            "send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rp",
            0
          ],
          "destination": [
            "low",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rp",
            0
          ],
          "destination": [
            "mid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rp",
            0
          ],
          "destination": [
            "hi",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rin",
            0
          ],
          "destination": [
            "amp",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "amp",
            0
          ],
          "destination": [
            "active",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "active",
            0
          ],
          "destination": [
            "hgate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "harm",
            0
          ],
          "destination": [
            "hgate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "hgate",
            0
          ],
          "destination": [
            "hg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rp",
            0
          ],
          "destination": [
            "hclip",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "hclip",
            0
          ],
          "destination": [
            "hmul",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "hmul",
            0
          ],
          "destination": [
            "harm",
            0
          ]
        }
      }
    ]
  }
}
