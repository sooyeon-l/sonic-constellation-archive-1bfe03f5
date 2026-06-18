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
          "text": "bp_arrangement_mix | conservative headroom | level/bypass buses for star, voice, Eunmin, Janice, Taewan layers",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "rs",
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
          "id": "rv",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            85,
            140,
            22
          ],
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "receive~ sc_voice_mix"
        }
      },
      {
        "box": {
          "id": "re",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            125,
            150,
            22
          ],
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "receive~ sc_eunmin_mix"
        }
      },
      {
        "box": {
          "id": "rj",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            165,
            150,
            22
          ],
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "receive~ sc_janice_mix"
        }
      },
      {
        "box": {
          "id": "gs",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            45,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.72"
        }
      },
      {
        "box": {
          "id": "gv",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            85,
            70,
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
          "id": "ge",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            125,
            70,
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
          "id": "gj",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            165,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.12"
        }
      },
      {
        "box": {
          "id": "a1",
          "maxclass": "newobj",
          "patching_rect": [
            300,
            65,
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
          "id": "a2",
          "maxclass": "newobj",
          "patching_rect": [
            300,
            145,
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
          "id": "a3",
          "maxclass": "newobj",
          "patching_rect": [
            370,
            105,
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
          "id": "lim",
          "maxclass": "newobj",
          "patching_rect": [
            450,
            105,
            120,
            22
          ],
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "clip~ -0.95 0.95"
        }
      },
      {
        "box": {
          "id": "tapin",
          "maxclass": "newobj",
          "patching_rect": [
            450,
            155,
            100,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "tapin~ 2000"
        }
      },
      {
        "box": {
          "id": "tapout",
          "maxclass": "newobj",
          "patching_rect": [
            570,
            155,
            105,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "tapout~ 420"
        }
      },
      {
        "box": {
          "id": "dg",
          "maxclass": "newobj",
          "patching_rect": [
            690,
            155,
            70,
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
          "id": "wet",
          "maxclass": "newobj",
          "patching_rect": [
            600,
            105,
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
          "id": "l",
          "maxclass": "newobj",
          "patching_rect": [
            690,
            90,
            130,
            22
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "text": "send~ sc_final_l"
        }
      },
      {
        "box": {
          "id": "r",
          "maxclass": "newobj",
          "patching_rect": [
            690,
            125,
            130,
            22
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "text": "send~ sc_final_r"
        }
      },
      {
        "box": {
          "id": "dac",
          "maxclass": "newobj",
          "patching_rect": [
            840,
            105,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "text": "dac~ 1 2"
        }
      },
      {
        "box": {
          "id": "rt",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            265,
            210,
            22
          ],
          "text": "receive~ sc_taewan_optional_mix",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "gt",
          "maxclass": "newobj",
          "patching_rect": [
            250,
            265,
            70,
            22
          ],
          "text": "*~ 0.08",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "aopt",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            260,
            40,
            22
          ],
          "text": "+~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "starLevel",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            40,
            135,
            22
          ],
          "text": "r sc_star_level",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "voiceLevel",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            75,
            135,
            22
          ],
          "text": "r sc_voice_level",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "eunminLevel",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            110,
            135,
            22
          ],
          "text": "r sc_eunmin_level",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "janiceLevel",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            145,
            135,
            22
          ],
          "text": "r sc_janice_level",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "taewanLevel",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            180,
            135,
            22
          ],
          "text": "r sc_taewan_level",
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
            "rs",
            0
          ],
          "destination": [
            "gs",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rv",
            0
          ],
          "destination": [
            "gv",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "re",
            0
          ],
          "destination": [
            "ge",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rj",
            0
          ],
          "destination": [
            "gj",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gs",
            0
          ],
          "destination": [
            "a1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gv",
            0
          ],
          "destination": [
            "a1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ge",
            0
          ],
          "destination": [
            "a2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gj",
            0
          ],
          "destination": [
            "a2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "a1",
            0
          ],
          "destination": [
            "a3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "a2",
            0
          ],
          "destination": [
            "a3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "lim",
            0
          ],
          "destination": [
            "tapin",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "tapin",
            0
          ],
          "destination": [
            "tapout",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "tapout",
            0
          ],
          "destination": [
            "dg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "lim",
            0
          ],
          "destination": [
            "wet",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dg",
            0
          ],
          "destination": [
            "wet",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "wet",
            0
          ],
          "destination": [
            "l",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "wet",
            0
          ],
          "destination": [
            "r",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "wet",
            0
          ],
          "destination": [
            "dac",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "wet",
            0
          ],
          "destination": [
            "dac",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rt",
            0
          ],
          "destination": [
            "gt",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gt",
            0
          ],
          "destination": [
            "aopt",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "a3",
            0
          ],
          "destination": [
            "aopt",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "aopt",
            0
          ],
          "destination": [
            "lim",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "starLevel",
            0
          ],
          "destination": [
            "gs",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voiceLevel",
            0
          ],
          "destination": [
            "gv",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "eunminLevel",
            0
          ],
          "destination": [
            "ge",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "janiceLevel",
            0
          ],
          "destination": [
            "gj",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "taewanLevel",
            0
          ],
          "destination": [
            "gt",
            1
          ]
        }
      }
    ]
  }
}
