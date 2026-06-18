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
      920,
      630
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
          "text": "bp_star_bank | original recordings | buffer~ s_0..s_6 | loadstar/playstar from sc_synth_commands",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "r",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            45,
            150,
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
          "id": "route",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            80,
            180,
            22
          ],
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "text": "route loadstar playstar"
        }
      },
      {
        "box": {
          "id": "rload",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            115,
            220,
            22
          ],
          "numinlets": 2,
          "numoutlets": 8,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "text": "route 0 1 2 3 4 5 6"
        }
      },
      {
        "box": {
          "id": "rplay",
          "maxclass": "newobj",
          "patching_rect": [
            260,
            115,
            220,
            22
          ],
          "numinlets": 2,
          "numoutlets": 8,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "text": "route 0 1 2 3 4 5 6"
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            10,
            565,
            850,
            20
          ],
          "text": "Each loaded voice keeps its explicit index: g0..g6 feed sc_star_0..sc_star_6 and the collective sc_star_mix. Paths may contain spaces.",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "rep0",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            155,
            115,
            22
          ],
          "text": "prepend replace",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "buf0",
          "maxclass": "newobj",
          "patching_rect": [
            135,
            155,
            105,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_0"
        }
      },
      {
        "box": {
          "id": "st0",
          "maxclass": "message",
          "patching_rect": [
            260,
            155,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pl0",
          "maxclass": "newobj",
          "patching_rect": [
            325,
            155,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_0"
        }
      },
      {
        "box": {
          "id": "g0",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            155,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.16"
        }
      },
      {
        "box": {
          "id": "rep1",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            205,
            115,
            22
          ],
          "text": "prepend replace",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "buf1",
          "maxclass": "newobj",
          "patching_rect": [
            135,
            205,
            105,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_1"
        }
      },
      {
        "box": {
          "id": "st1",
          "maxclass": "message",
          "patching_rect": [
            260,
            205,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pl1",
          "maxclass": "newobj",
          "patching_rect": [
            325,
            205,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_1"
        }
      },
      {
        "box": {
          "id": "g1",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            205,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.16"
        }
      },
      {
        "box": {
          "id": "rep2",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            255,
            115,
            22
          ],
          "text": "prepend replace",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "buf2",
          "maxclass": "newobj",
          "patching_rect": [
            135,
            255,
            105,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_2"
        }
      },
      {
        "box": {
          "id": "st2",
          "maxclass": "message",
          "patching_rect": [
            260,
            255,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pl2",
          "maxclass": "newobj",
          "patching_rect": [
            325,
            255,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_2"
        }
      },
      {
        "box": {
          "id": "g2",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            255,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.16"
        }
      },
      {
        "box": {
          "id": "rep3",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            305,
            115,
            22
          ],
          "text": "prepend replace",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "buf3",
          "maxclass": "newobj",
          "patching_rect": [
            135,
            305,
            105,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_3"
        }
      },
      {
        "box": {
          "id": "st3",
          "maxclass": "message",
          "patching_rect": [
            260,
            305,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pl3",
          "maxclass": "newobj",
          "patching_rect": [
            325,
            305,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_3"
        }
      },
      {
        "box": {
          "id": "g3",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            305,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.16"
        }
      },
      {
        "box": {
          "id": "rep4",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            355,
            115,
            22
          ],
          "text": "prepend replace",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "buf4",
          "maxclass": "newobj",
          "patching_rect": [
            135,
            355,
            105,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_4"
        }
      },
      {
        "box": {
          "id": "st4",
          "maxclass": "message",
          "patching_rect": [
            260,
            355,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pl4",
          "maxclass": "newobj",
          "patching_rect": [
            325,
            355,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_4"
        }
      },
      {
        "box": {
          "id": "g4",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            355,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.16"
        }
      },
      {
        "box": {
          "id": "rep5",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            405,
            115,
            22
          ],
          "text": "prepend replace",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "buf5",
          "maxclass": "newobj",
          "patching_rect": [
            135,
            405,
            105,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_5"
        }
      },
      {
        "box": {
          "id": "st5",
          "maxclass": "message",
          "patching_rect": [
            260,
            405,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pl5",
          "maxclass": "newobj",
          "patching_rect": [
            325,
            405,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_5"
        }
      },
      {
        "box": {
          "id": "g5",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            405,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.16"
        }
      },
      {
        "box": {
          "id": "rep6",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            455,
            115,
            22
          ],
          "text": "prepend replace",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "buf6",
          "maxclass": "newobj",
          "patching_rect": [
            135,
            455,
            105,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "text": "buffer~ s_6"
        }
      },
      {
        "box": {
          "id": "st6",
          "maxclass": "message",
          "patching_rect": [
            260,
            455,
            52,
            22
          ],
          "text": "start",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "pl6",
          "maxclass": "newobj",
          "patching_rect": [
            325,
            455,
            80,
            22
          ],
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "text": "play~ s_6"
        }
      },
      {
        "box": {
          "id": "g6",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            455,
            70,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "text": "*~ 0.16"
        }
      },
      {
        "box": {
          "id": "a01",
          "maxclass": "newobj",
          "patching_rect": [
            550,
            170,
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
          "id": "a23",
          "maxclass": "newobj",
          "patching_rect": [
            550,
            215,
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
          "id": "a45",
          "maxclass": "newobj",
          "patching_rect": [
            550,
            260,
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
          "id": "a456",
          "maxclass": "newobj",
          "patching_rect": [
            550,
            305,
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
          "id": "a0123",
          "maxclass": "newobj",
          "patching_rect": [
            550,
            350,
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
          "id": "aall",
          "maxclass": "newobj",
          "patching_rect": [
            550,
            395,
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
          "id": "send",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            300,
            140,
            22
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "text": "send~ sc_star_mix"
        }
      },
      {
        "box": {
          "id": "si0",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            155,
            105,
            22
          ],
          "text": "send~ sc_star_0",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "si1",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            205,
            105,
            22
          ],
          "text": "send~ sc_star_1",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "si2",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            255,
            105,
            22
          ],
          "text": "send~ sc_star_2",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "si3",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            305,
            105,
            22
          ],
          "text": "send~ sc_star_3",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "si4",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            355,
            105,
            22
          ],
          "text": "send~ sc_star_4",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "si5",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            405,
            105,
            22
          ],
          "text": "send~ sc_star_5",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "si6",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            455,
            105,
            22
          ],
          "text": "send~ sc_star_6",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "r",
            0
          ],
          "destination": [
            "route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            0
          ],
          "destination": [
            "rload",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            1
          ],
          "destination": [
            "rplay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rload",
            0
          ],
          "destination": [
            "rep0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rep0",
            0
          ],
          "destination": [
            "buf0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rplay",
            0
          ],
          "destination": [
            "st0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "st0",
            0
          ],
          "destination": [
            "pl0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pl0",
            0
          ],
          "destination": [
            "g0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rload",
            1
          ],
          "destination": [
            "rep1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rep1",
            0
          ],
          "destination": [
            "buf1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rplay",
            1
          ],
          "destination": [
            "st1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "st1",
            0
          ],
          "destination": [
            "pl1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pl1",
            0
          ],
          "destination": [
            "g1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rload",
            2
          ],
          "destination": [
            "rep2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rep2",
            0
          ],
          "destination": [
            "buf2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rplay",
            2
          ],
          "destination": [
            "st2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "st2",
            0
          ],
          "destination": [
            "pl2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pl2",
            0
          ],
          "destination": [
            "g2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rload",
            3
          ],
          "destination": [
            "rep3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rep3",
            0
          ],
          "destination": [
            "buf3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rplay",
            3
          ],
          "destination": [
            "st3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "st3",
            0
          ],
          "destination": [
            "pl3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pl3",
            0
          ],
          "destination": [
            "g3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rload",
            4
          ],
          "destination": [
            "rep4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rep4",
            0
          ],
          "destination": [
            "buf4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rplay",
            4
          ],
          "destination": [
            "st4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "st4",
            0
          ],
          "destination": [
            "pl4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pl4",
            0
          ],
          "destination": [
            "g4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rload",
            5
          ],
          "destination": [
            "rep5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rep5",
            0
          ],
          "destination": [
            "buf5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rplay",
            5
          ],
          "destination": [
            "st5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "st5",
            0
          ],
          "destination": [
            "pl5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pl5",
            0
          ],
          "destination": [
            "g5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rload",
            6
          ],
          "destination": [
            "rep6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rep6",
            0
          ],
          "destination": [
            "buf6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rplay",
            6
          ],
          "destination": [
            "st6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "st6",
            0
          ],
          "destination": [
            "pl6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pl6",
            0
          ],
          "destination": [
            "g6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g0",
            0
          ],
          "destination": [
            "a01",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g1",
            0
          ],
          "destination": [
            "a01",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g2",
            0
          ],
          "destination": [
            "a23",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g3",
            0
          ],
          "destination": [
            "a23",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g4",
            0
          ],
          "destination": [
            "a45",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g5",
            0
          ],
          "destination": [
            "a45",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "a45",
            0
          ],
          "destination": [
            "a456",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g6",
            0
          ],
          "destination": [
            "a456",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "a01",
            0
          ],
          "destination": [
            "a0123",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "a23",
            0
          ],
          "destination": [
            "a0123",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "a0123",
            0
          ],
          "destination": [
            "aall",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "a456",
            0
          ],
          "destination": [
            "aall",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "aall",
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
            "g0",
            0
          ],
          "destination": [
            "si0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g1",
            0
          ],
          "destination": [
            "si1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g2",
            0
          ],
          "destination": [
            "si2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g3",
            0
          ],
          "destination": [
            "si3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g4",
            0
          ],
          "destination": [
            "si4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g5",
            0
          ],
          "destination": [
            "si5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "g6",
            0
          ],
          "destination": [
            "si6",
            0
          ]
        }
      }
    ]
  }
}
