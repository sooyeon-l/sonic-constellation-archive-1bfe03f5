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
          "text": "bp_hyerin_mapping | preserves Hyerin pitch-to-color and amplitude-to-intensity/spatial mapping concepts",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "rp",
          "maxclass": "newobj",
          "patching_rect": [
            10,
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
          "id": "ra",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            45,
            120,
            22
          ],
          "text": "r sc_analysis_amp",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "clipP",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            85,
            95,
            22
          ],
          "text": "clip 80. 600.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "scaleHue",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            125,
            155,
            22
          ],
          "text": "scale 80. 600. 0. 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "clipA",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            85,
            80,
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
          "id": "scaleRad",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            125,
            160,
            22
          ],
          "text": "scale 0. 1. 0.25 1.",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sh",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            165,
            120,
            22
          ],
          "text": "s sc_hyerin_hue",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "si",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            165,
            150,
            22
          ],
          "text": "s sc_hyerin_intensity",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            10,
            210,
            850,
            20
          ],
          "text": "Website metadata remains source of truth for placement/volume; Max amplitude adds performance intensity. star_meta exposes x/y/duration/volume without signed URLs.",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "metaIn",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            230,
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
            10,
            265,
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
            10,
            300,
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
          "id": "sx",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            300,
            90,
            22
          ],
          "text": "s sc_star_x",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sy",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            300,
            90,
            22
          ],
          "text": "s sc_star_y",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sd",
          "maxclass": "newobj",
          "patching_rect": [
            370,
            300,
            130,
            22
          ],
          "text": "s sc_star_duration",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sv",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            300,
            160,
            22
          ],
          "text": "s sc_star_volume_peak",
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
            "rp",
            0
          ],
          "destination": [
            "clipP",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "clipP",
            0
          ],
          "destination": [
            "scaleHue",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scaleHue",
            0
          ],
          "destination": [
            "sh",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ra",
            0
          ],
          "destination": [
            "clipA",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "clipA",
            0
          ],
          "destination": [
            "scaleRad",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scaleRad",
            0
          ],
          "destination": [
            "si",
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
            1
          ],
          "destination": [
            "sx",
            0
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
            "sy",
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
            "sd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metaUnpack",
            4
          ],
          "destination": [
            "sv",
            0
          ]
        }
      }
    ]
  }
}
