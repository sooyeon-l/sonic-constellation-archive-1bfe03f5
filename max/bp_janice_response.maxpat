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
          "text": "bp_janice_response | amplitude/onset-triggered additive response tones; source-derived pitch relationships",
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
          "id": "peak",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            85,
            95,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "text": "peakamp~ 25"
        }
      },
      {
        "box": {
          "id": "gt",
          "maxclass": "newobj",
          "patching_rect": [
            120,
            85,
            65,
            22
          ],
          "text": "> 0.05",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "chg",
          "maxclass": "newobj",
          "patching_rect": [
            200,
            85,
            65,
            22
          ],
          "text": "change",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sel",
          "maxclass": "newobj",
          "patching_rect": [
            280,
            85,
            55,
            22
          ],
          "text": "sel 1",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "rp",
          "maxclass": "newobj",
          "patching_rect": [
            360,
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
          "id": "mtof",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            85,
            170,
            22
          ],
          "text": "scale 80. 600. 220. 880.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "osc",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            125,
            90,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "cycle~ 330"
        }
      },
      {
        "box": {
          "id": "envmsg",
          "maxclass": "message",
          "patching_rect": [
            280,
            125,
            175,
            22
          ],
          "text": "0. 1. 0.12 40. 0. 650.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "env",
          "maxclass": "newobj",
          "patching_rect": [
            280,
            165,
            75,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "line~ 0."
        }
      },
      {
        "box": {
          "id": "vca",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            205,
            45,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "gain",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            245,
            75,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.08"
        }
      },
      {
        "box": {
          "id": "send",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            285,
            150,
            22
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "text": "send~ sc_janice_mix"
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
            "peak",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak",
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
            "chg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "chg",
            0
          ],
          "destination": [
            "sel",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sel",
            0
          ],
          "destination": [
            "envmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "envmsg",
            0
          ],
          "destination": [
            "env",
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
            "mtof",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mtof",
            0
          ],
          "destination": [
            "osc",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "osc",
            0
          ],
          "destination": [
            "vca",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "env",
            0
          ],
          "destination": [
            "vca",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "vca",
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
      }
    ]
  }
}
