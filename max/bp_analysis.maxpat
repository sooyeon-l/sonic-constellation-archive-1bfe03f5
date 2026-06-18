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
            930,
            22
          ],
          "text": "bp_analysis | shared per-star pitch/amplitude analysis; one source of truth for Max-derived pitch",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            10,
            610,
            1020,
            22
          ],
          "text": "Outputs per-star pitch, pitched flag, normalized pitch/amplitude, duration, avg amplitude, and x/y metadata. Unpitched speech is flagged and downstream modules must fall back safely.",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "rin",
          "maxclass": "newobj",
          "patching_rect": [
            760,
            60,
            140,
            22
          ],
          "text": "receive~ sc_star_mix",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "fzmix",
          "maxclass": "newobj",
          "patching_rect": [
            760,
            100,
            70,
            22
          ],
          "text": "fzero~",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "float",
            "float",
            "float"
          ]
        }
      },
      {
        "box": {
          "id": "pkmix",
          "maxclass": "newobj",
          "patching_rect": [
            860,
            100,
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
          "id": "spmix",
          "maxclass": "newobj",
          "patching_rect": [
            760,
            140,
            140,
            22
          ],
          "text": "s sc_analysis_pitch",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "samix",
          "maxclass": "newobj",
          "patching_rect": [
            920,
            140,
            130,
            22
          ],
          "text": "s sc_analysis_amp",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "safe",
          "maxclass": "newobj",
          "patching_rect": [
            760,
            180,
            115,
            22
          ],
          "text": "clip 20. 4000.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitch_note",
          "maxclass": "comment",
          "patching_rect": [
            760,
            220,
            370,
            22
          ],
          "text": "Unpitched speech can output unstable pitch; downstream modules use conservative clip/fallback ranges.",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "r0",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            55,
            140,
            22
          ],
          "text": "receive~ sc_star_0",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "fz0",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            55,
            70,
            22
          ],
          "text": "fzero~",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "float",
            "float",
            "float"
          ]
        }
      },
      {
        "box": {
          "id": "pk0",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            90,
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
          "id": "cp0",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            55,
            115,
            22
          ],
          "text": "clip 20. 4000.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pp0",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            55,
            80,
            22
          ],
          "text": "pak 0 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pa0",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            90,
            80,
            22
          ],
          "text": "pak 0 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sp0",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            55,
            190,
            22
          ],
          "text": "s sc_analysis_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sa0",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            90,
            180,
            22
          ],
          "text": "s sc_analysis_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "r1",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            130,
            140,
            22
          ],
          "text": "receive~ sc_star_1",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "fz1",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            130,
            70,
            22
          ],
          "text": "fzero~",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "float",
            "float",
            "float"
          ]
        }
      },
      {
        "box": {
          "id": "pk1",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            165,
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
          "id": "cp1",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            130,
            115,
            22
          ],
          "text": "clip 20. 4000.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pp1",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            130,
            80,
            22
          ],
          "text": "pak 1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pa1",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            165,
            80,
            22
          ],
          "text": "pak 1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sp1",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            130,
            190,
            22
          ],
          "text": "s sc_analysis_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sa1",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            165,
            180,
            22
          ],
          "text": "s sc_analysis_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "r2",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            205,
            140,
            22
          ],
          "text": "receive~ sc_star_2",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "fz2",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            205,
            70,
            22
          ],
          "text": "fzero~",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "float",
            "float",
            "float"
          ]
        }
      },
      {
        "box": {
          "id": "pk2",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            240,
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
          "id": "cp2",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            205,
            115,
            22
          ],
          "text": "clip 20. 4000.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pp2",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            205,
            80,
            22
          ],
          "text": "pak 2 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pa2",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            240,
            80,
            22
          ],
          "text": "pak 2 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sp2",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            205,
            190,
            22
          ],
          "text": "s sc_analysis_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sa2",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            240,
            180,
            22
          ],
          "text": "s sc_analysis_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "r3",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            280,
            140,
            22
          ],
          "text": "receive~ sc_star_3",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "fz3",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            280,
            70,
            22
          ],
          "text": "fzero~",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "float",
            "float",
            "float"
          ]
        }
      },
      {
        "box": {
          "id": "pk3",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            315,
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
          "id": "cp3",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            280,
            115,
            22
          ],
          "text": "clip 20. 4000.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pp3",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            280,
            80,
            22
          ],
          "text": "pak 3 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pa3",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            315,
            80,
            22
          ],
          "text": "pak 3 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sp3",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            280,
            190,
            22
          ],
          "text": "s sc_analysis_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sa3",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            315,
            180,
            22
          ],
          "text": "s sc_analysis_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "r4",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            355,
            140,
            22
          ],
          "text": "receive~ sc_star_4",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "fz4",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            355,
            70,
            22
          ],
          "text": "fzero~",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "float",
            "float",
            "float"
          ]
        }
      },
      {
        "box": {
          "id": "pk4",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            390,
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
          "id": "cp4",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            355,
            115,
            22
          ],
          "text": "clip 20. 4000.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pp4",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            355,
            80,
            22
          ],
          "text": "pak 4 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pa4",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            390,
            80,
            22
          ],
          "text": "pak 4 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sp4",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            355,
            190,
            22
          ],
          "text": "s sc_analysis_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sa4",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            390,
            180,
            22
          ],
          "text": "s sc_analysis_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "r5",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            430,
            140,
            22
          ],
          "text": "receive~ sc_star_5",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "fz5",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            430,
            70,
            22
          ],
          "text": "fzero~",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "float",
            "float",
            "float"
          ]
        }
      },
      {
        "box": {
          "id": "pk5",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            465,
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
          "id": "cp5",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            430,
            115,
            22
          ],
          "text": "clip 20. 4000.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pp5",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            430,
            80,
            22
          ],
          "text": "pak 5 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pa5",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            465,
            80,
            22
          ],
          "text": "pak 5 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sp5",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            430,
            190,
            22
          ],
          "text": "s sc_analysis_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sa5",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            465,
            180,
            22
          ],
          "text": "s sc_analysis_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "r6",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            505,
            140,
            22
          ],
          "text": "receive~ sc_star_6",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "fz6",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            505,
            70,
            22
          ],
          "text": "fzero~",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "float",
            "float",
            "float"
          ]
        }
      },
      {
        "box": {
          "id": "pk6",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            540,
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
          "id": "cp6",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            505,
            115,
            22
          ],
          "text": "clip 20. 4000.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pp6",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            505,
            80,
            22
          ],
          "text": "pak 6 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pa6",
          "maxclass": "newobj",
          "patching_rect": [
            410,
            540,
            80,
            22
          ],
          "text": "pak 6 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sp6",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            505,
            190,
            22
          ],
          "text": "s sc_analysis_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sa6",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            540,
            180,
            22
          ],
          "text": "s sc_analysis_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "metaIn",
          "maxclass": "newobj",
          "patching_rect": [
            760,
            280,
            140,
            22
          ],
          "text": "r sc_synth_commands",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "metaRoute",
          "maxclass": "newobj",
          "patching_rect": [
            760,
            315,
            110,
            22
          ],
          "text": "route star_meta",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "metaUnpack",
          "maxclass": "newobj",
          "patching_rect": [
            760,
            350,
            130,
            22
          ],
          "text": "unpack i f f f f f",
          "numinlets": 1,
          "numoutlets": 6,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "durPak",
          "maxclass": "newobj",
          "patching_rect": [
            920,
            350,
            80,
            22
          ],
          "text": "pak 0 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "avgPak",
          "maxclass": "newobj",
          "patching_rect": [
            920,
            385,
            80,
            22
          ],
          "text": "pak 0 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "xyPak",
          "maxclass": "newobj",
          "patching_rect": [
            920,
            420,
            105,
            22
          ],
          "text": "pack 0 0. 0.",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "durSend",
          "maxclass": "newobj",
          "patching_rect": [
            1040,
            350,
            220,
            22
          ],
          "text": "s sc_analysis_duration_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "avgSend",
          "maxclass": "newobj",
          "patching_rect": [
            1040,
            385,
            220,
            22
          ],
          "text": "s sc_analysis_avg_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "xySend",
          "maxclass": "newobj",
          "patching_rect": [
            1040,
            420,
            185,
            22
          ],
          "text": "s sc_analysis_xy_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitched0",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            77,
            55,
            22
          ],
          "text": "> 20.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "pitPak0",
          "maxclass": "newobj",
          "patching_rect": [
            340,
            77,
            75,
            22
          ],
          "text": "pak 0 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitSend0",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            77,
            205,
            22
          ],
          "text": "s sc_analysis_pitched_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normP0",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            99,
            155,
            22
          ],
          "text": "scale 20. 4000. 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPPak0",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            99,
            80,
            22
          ],
          "text": "pak 0 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPSend0",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            99,
            230,
            22
          ],
          "text": "s sc_analysis_norm_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normA0",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            121,
            75,
            22
          ],
          "text": "clip 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normAPak0",
          "maxclass": "newobj",
          "patching_rect": [
            350,
            121,
            80,
            22
          ],
          "text": "pak 0 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normASend0",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            121,
            220,
            22
          ],
          "text": "s sc_analysis_norm_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitched1",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            152,
            55,
            22
          ],
          "text": "> 20.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "pitPak1",
          "maxclass": "newobj",
          "patching_rect": [
            340,
            152,
            75,
            22
          ],
          "text": "pak 1 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitSend1",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            152,
            205,
            22
          ],
          "text": "s sc_analysis_pitched_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normP1",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            174,
            155,
            22
          ],
          "text": "scale 20. 4000. 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPPak1",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            174,
            80,
            22
          ],
          "text": "pak 1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPSend1",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            174,
            230,
            22
          ],
          "text": "s sc_analysis_norm_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normA1",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            196,
            75,
            22
          ],
          "text": "clip 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normAPak1",
          "maxclass": "newobj",
          "patching_rect": [
            350,
            196,
            80,
            22
          ],
          "text": "pak 1 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normASend1",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            196,
            220,
            22
          ],
          "text": "s sc_analysis_norm_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitched2",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            227,
            55,
            22
          ],
          "text": "> 20.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "pitPak2",
          "maxclass": "newobj",
          "patching_rect": [
            340,
            227,
            75,
            22
          ],
          "text": "pak 2 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitSend2",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            227,
            205,
            22
          ],
          "text": "s sc_analysis_pitched_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normP2",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            249,
            155,
            22
          ],
          "text": "scale 20. 4000. 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPPak2",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            249,
            80,
            22
          ],
          "text": "pak 2 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPSend2",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            249,
            230,
            22
          ],
          "text": "s sc_analysis_norm_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normA2",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            271,
            75,
            22
          ],
          "text": "clip 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normAPak2",
          "maxclass": "newobj",
          "patching_rect": [
            350,
            271,
            80,
            22
          ],
          "text": "pak 2 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normASend2",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            271,
            220,
            22
          ],
          "text": "s sc_analysis_norm_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitched3",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            302,
            55,
            22
          ],
          "text": "> 20.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "pitPak3",
          "maxclass": "newobj",
          "patching_rect": [
            340,
            302,
            75,
            22
          ],
          "text": "pak 3 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitSend3",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            302,
            205,
            22
          ],
          "text": "s sc_analysis_pitched_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normP3",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            324,
            155,
            22
          ],
          "text": "scale 20. 4000. 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPPak3",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            324,
            80,
            22
          ],
          "text": "pak 3 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPSend3",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            324,
            230,
            22
          ],
          "text": "s sc_analysis_norm_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normA3",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            346,
            75,
            22
          ],
          "text": "clip 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normAPak3",
          "maxclass": "newobj",
          "patching_rect": [
            350,
            346,
            80,
            22
          ],
          "text": "pak 3 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normASend3",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            346,
            220,
            22
          ],
          "text": "s sc_analysis_norm_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitched4",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            377,
            55,
            22
          ],
          "text": "> 20.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "pitPak4",
          "maxclass": "newobj",
          "patching_rect": [
            340,
            377,
            75,
            22
          ],
          "text": "pak 4 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitSend4",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            377,
            205,
            22
          ],
          "text": "s sc_analysis_pitched_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normP4",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            399,
            155,
            22
          ],
          "text": "scale 20. 4000. 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPPak4",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            399,
            80,
            22
          ],
          "text": "pak 4 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPSend4",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            399,
            230,
            22
          ],
          "text": "s sc_analysis_norm_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normA4",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            421,
            75,
            22
          ],
          "text": "clip 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normAPak4",
          "maxclass": "newobj",
          "patching_rect": [
            350,
            421,
            80,
            22
          ],
          "text": "pak 4 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normASend4",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            421,
            220,
            22
          ],
          "text": "s sc_analysis_norm_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitched5",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            452,
            55,
            22
          ],
          "text": "> 20.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "pitPak5",
          "maxclass": "newobj",
          "patching_rect": [
            340,
            452,
            75,
            22
          ],
          "text": "pak 5 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitSend5",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            452,
            205,
            22
          ],
          "text": "s sc_analysis_pitched_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normP5",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            474,
            155,
            22
          ],
          "text": "scale 20. 4000. 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPPak5",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            474,
            80,
            22
          ],
          "text": "pak 5 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPSend5",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            474,
            230,
            22
          ],
          "text": "s sc_analysis_norm_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normA5",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            496,
            75,
            22
          ],
          "text": "clip 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normAPak5",
          "maxclass": "newobj",
          "patching_rect": [
            350,
            496,
            80,
            22
          ],
          "text": "pak 5 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normASend5",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            496,
            220,
            22
          ],
          "text": "s sc_analysis_norm_amp_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitched6",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            527,
            55,
            22
          ],
          "text": "> 20.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "pitPak6",
          "maxclass": "newobj",
          "patching_rect": [
            340,
            527,
            75,
            22
          ],
          "text": "pak 6 0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pitSend6",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            527,
            205,
            22
          ],
          "text": "s sc_analysis_pitched_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normP6",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            549,
            155,
            22
          ],
          "text": "scale 20. 4000. 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPPak6",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            549,
            80,
            22
          ],
          "text": "pak 6 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normPSend6",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            549,
            230,
            22
          ],
          "text": "s sc_analysis_norm_pitch_by_star",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normA6",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            571,
            75,
            22
          ],
          "text": "clip 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normAPak6",
          "maxclass": "newobj",
          "patching_rect": [
            350,
            571,
            80,
            22
          ],
          "text": "pak 6 0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "normASend6",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            571,
            220,
            22
          ],
          "text": "s sc_analysis_norm_amp_by_star",
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
            "fzmix",
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
            "pkmix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fzmix",
            0
          ],
          "destination": [
            "safe",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "safe",
            0
          ],
          "destination": [
            "spmix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pkmix",
            0
          ],
          "destination": [
            "samix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r0",
            0
          ],
          "destination": [
            "fz0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r0",
            0
          ],
          "destination": [
            "pk0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fz0",
            0
          ],
          "destination": [
            "cp0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp0",
            0
          ],
          "destination": [
            "pp0",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk0",
            0
          ],
          "destination": [
            "pa0",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pp0",
            0
          ],
          "destination": [
            "sp0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pa0",
            0
          ],
          "destination": [
            "sa0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r1",
            0
          ],
          "destination": [
            "fz1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r1",
            0
          ],
          "destination": [
            "pk1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fz1",
            0
          ],
          "destination": [
            "cp1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp1",
            0
          ],
          "destination": [
            "pp1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk1",
            0
          ],
          "destination": [
            "pa1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pp1",
            0
          ],
          "destination": [
            "sp1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pa1",
            0
          ],
          "destination": [
            "sa1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r2",
            0
          ],
          "destination": [
            "fz2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r2",
            0
          ],
          "destination": [
            "pk2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fz2",
            0
          ],
          "destination": [
            "cp2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp2",
            0
          ],
          "destination": [
            "pp2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk2",
            0
          ],
          "destination": [
            "pa2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pp2",
            0
          ],
          "destination": [
            "sp2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pa2",
            0
          ],
          "destination": [
            "sa2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r3",
            0
          ],
          "destination": [
            "fz3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r3",
            0
          ],
          "destination": [
            "pk3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fz3",
            0
          ],
          "destination": [
            "cp3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp3",
            0
          ],
          "destination": [
            "pp3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk3",
            0
          ],
          "destination": [
            "pa3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pp3",
            0
          ],
          "destination": [
            "sp3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pa3",
            0
          ],
          "destination": [
            "sa3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r4",
            0
          ],
          "destination": [
            "fz4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r4",
            0
          ],
          "destination": [
            "pk4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fz4",
            0
          ],
          "destination": [
            "cp4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp4",
            0
          ],
          "destination": [
            "pp4",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk4",
            0
          ],
          "destination": [
            "pa4",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pp4",
            0
          ],
          "destination": [
            "sp4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pa4",
            0
          ],
          "destination": [
            "sa4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r5",
            0
          ],
          "destination": [
            "fz5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r5",
            0
          ],
          "destination": [
            "pk5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fz5",
            0
          ],
          "destination": [
            "cp5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp5",
            0
          ],
          "destination": [
            "pp5",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk5",
            0
          ],
          "destination": [
            "pa5",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pp5",
            0
          ],
          "destination": [
            "sp5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pa5",
            0
          ],
          "destination": [
            "sa5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r6",
            0
          ],
          "destination": [
            "fz6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "r6",
            0
          ],
          "destination": [
            "pk6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fz6",
            0
          ],
          "destination": [
            "cp6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp6",
            0
          ],
          "destination": [
            "pp6",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk6",
            0
          ],
          "destination": [
            "pa6",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pp6",
            0
          ],
          "destination": [
            "sp6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pa6",
            0
          ],
          "destination": [
            "sa6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metaIn",
            0
          ],
          "destination": [
            "metaRoute",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metaRoute",
            0
          ],
          "destination": [
            "metaUnpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metaUnpack",
            0
          ],
          "destination": [
            "durPak",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metaUnpack",
            3
          ],
          "destination": [
            "durPak",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "durPak",
            0
          ],
          "destination": [
            "durSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metaUnpack",
            0
          ],
          "destination": [
            "avgPak",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metaUnpack",
            5
          ],
          "destination": [
            "avgPak",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "avgPak",
            0
          ],
          "destination": [
            "avgSend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metaUnpack",
            0
          ],
          "destination": [
            "xyPak",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metaUnpack",
            1
          ],
          "destination": [
            "xyPak",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metaUnpack",
            2
          ],
          "destination": [
            "xyPak",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "xyPak",
            0
          ],
          "destination": [
            "xySend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp0",
            0
          ],
          "destination": [
            "pitched0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitched0",
            0
          ],
          "destination": [
            "pitPak0",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitPak0",
            0
          ],
          "destination": [
            "pitSend0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp0",
            0
          ],
          "destination": [
            "normP0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normP0",
            0
          ],
          "destination": [
            "normPPak0",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normPPak0",
            0
          ],
          "destination": [
            "normPSend0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk0",
            0
          ],
          "destination": [
            "normA0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normA0",
            0
          ],
          "destination": [
            "normAPak0",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normAPak0",
            0
          ],
          "destination": [
            "normASend0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp1",
            0
          ],
          "destination": [
            "pitched1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitched1",
            0
          ],
          "destination": [
            "pitPak1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitPak1",
            0
          ],
          "destination": [
            "pitSend1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp1",
            0
          ],
          "destination": [
            "normP1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normP1",
            0
          ],
          "destination": [
            "normPPak1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normPPak1",
            0
          ],
          "destination": [
            "normPSend1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk1",
            0
          ],
          "destination": [
            "normA1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normA1",
            0
          ],
          "destination": [
            "normAPak1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normAPak1",
            0
          ],
          "destination": [
            "normASend1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp2",
            0
          ],
          "destination": [
            "pitched2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitched2",
            0
          ],
          "destination": [
            "pitPak2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitPak2",
            0
          ],
          "destination": [
            "pitSend2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp2",
            0
          ],
          "destination": [
            "normP2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normP2",
            0
          ],
          "destination": [
            "normPPak2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normPPak2",
            0
          ],
          "destination": [
            "normPSend2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk2",
            0
          ],
          "destination": [
            "normA2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normA2",
            0
          ],
          "destination": [
            "normAPak2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normAPak2",
            0
          ],
          "destination": [
            "normASend2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp3",
            0
          ],
          "destination": [
            "pitched3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitched3",
            0
          ],
          "destination": [
            "pitPak3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitPak3",
            0
          ],
          "destination": [
            "pitSend3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp3",
            0
          ],
          "destination": [
            "normP3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normP3",
            0
          ],
          "destination": [
            "normPPak3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normPPak3",
            0
          ],
          "destination": [
            "normPSend3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk3",
            0
          ],
          "destination": [
            "normA3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normA3",
            0
          ],
          "destination": [
            "normAPak3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normAPak3",
            0
          ],
          "destination": [
            "normASend3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp4",
            0
          ],
          "destination": [
            "pitched4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitched4",
            0
          ],
          "destination": [
            "pitPak4",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitPak4",
            0
          ],
          "destination": [
            "pitSend4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp4",
            0
          ],
          "destination": [
            "normP4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normP4",
            0
          ],
          "destination": [
            "normPPak4",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normPPak4",
            0
          ],
          "destination": [
            "normPSend4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk4",
            0
          ],
          "destination": [
            "normA4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normA4",
            0
          ],
          "destination": [
            "normAPak4",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normAPak4",
            0
          ],
          "destination": [
            "normASend4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp5",
            0
          ],
          "destination": [
            "pitched5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitched5",
            0
          ],
          "destination": [
            "pitPak5",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitPak5",
            0
          ],
          "destination": [
            "pitSend5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp5",
            0
          ],
          "destination": [
            "normP5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normP5",
            0
          ],
          "destination": [
            "normPPak5",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normPPak5",
            0
          ],
          "destination": [
            "normPSend5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk5",
            0
          ],
          "destination": [
            "normA5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normA5",
            0
          ],
          "destination": [
            "normAPak5",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normAPak5",
            0
          ],
          "destination": [
            "normASend5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp6",
            0
          ],
          "destination": [
            "pitched6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitched6",
            0
          ],
          "destination": [
            "pitPak6",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pitPak6",
            0
          ],
          "destination": [
            "pitSend6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cp6",
            0
          ],
          "destination": [
            "normP6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normP6",
            0
          ],
          "destination": [
            "normPPak6",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normPPak6",
            0
          ],
          "destination": [
            "normPSend6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pk6",
            0
          ],
          "destination": [
            "normA6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normA6",
            0
          ],
          "destination": [
            "normAPak6",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "normAPak6",
            0
          ],
          "destination": [
            "normASend6",
            0
          ]
        }
      }
    ]
  }
}
