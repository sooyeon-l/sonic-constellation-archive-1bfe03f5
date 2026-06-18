{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      60,
      80,
      1220,
      930
    ],
    "bglocked": 0,
    "openinpresentation": 0,
    "default_fontsize": 12,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [
      15,
      15
    ],
    "gridsnaponopen": 1,
    "objectsnaponopen": 1,
    "statusbarvisible": 2,
    "toolbarvisible": 1,
    "lefttoolbarpinned": 0,
    "toptoolbarpinned": 0,
    "righttoolbarpinned": 0,
    "bottomtoolbarpinned": 0,
    "toolbars_unpinned_last_save": 0,
    "tallnewobj": 0,
    "boxanimatetime": 200,
    "enablehscroll": 1,
    "enablevscroll": 1,
    "devicewidth": 0,
    "description": "",
    "digest": "",
    "tags": "",
    "style": "",
    "subpatcher_template": "",
    "boxes": [
      {
        "box": {
          "id": "c0",
          "maxclass": "comment",
          "patching_rect": [
            10,
            10,
            980,
            22
          ],
          "text": "bp_taewan_visuals | adapted from Taewan AudioVisual/MainSynth: event-driven ribbons, accents, motionglitch, bloom"
        }
      },
      {
        "box": {
          "id": "cmd",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            48,
            145,
            22
          ],
          "text": "r sc_synth_commands"
        }
      },
      {
        "box": {
          "id": "route",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            82,
            760,
            22
          ],
          "text": "route visual_star_0 visual_star_1 visual_star_2 visual_star_3 visual_star_4 visual_star_5 visual_star_6 visual_reset"
        }
      },
      {
        "box": {
          "id": "world",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            126,
            690,
            22
          ],
          "text": "jit.world sc_visual @floating 1 @fsaa 1 @erase_color 0. 0. 0. 1. @size 960 720 @enable 1"
        }
      },
      {
        "box": {
          "id": "lb",
          "maxclass": "newobj",
          "patching_rect": [
            730,
            126,
            70,
            22
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "worldMsg",
          "maxclass": "message",
          "patching_rect": [
            810,
            126,
            160,
            22
          ],
          "text": "enable 1, floating 1"
        }
      },
      {
        "box": {
          "id": "motion",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            160,
            280,
            22
          ],
          "text": "jit.gl.pass sc_visual @fxname motionglitch"
        }
      },
      {
        "box": {
          "id": "bloom",
          "maxclass": "newobj",
          "patching_rect": [
            310,
            160,
            250,
            22
          ],
          "text": "jit.gl.pass sc_visual @fxname bloom-hq"
        }
      },
      {
        "box": {
          "id": "animSeed",
          "maxclass": "message",
          "patching_rect": [
            860,
            160,
            130,
            22
          ],
          "text": "turn 0. 0. 0.35"
        }
      },
      {
        "box": {
          "id": "anim",
          "maxclass": "newobj",
          "patching_rect": [
            1010,
            160,
            110,
            22
          ],
          "text": "jit.anim.drive"
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            10,
            194,
            1030,
            22
          ],
          "text": "visual_star_N carries x y amp pitch from real synthesis timing. Each star animates its own visual voice instead of broadcasting one static shape."
        }
      },
      {
        "box": {
          "id": "taudio",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            850,
            130,
            22
          ],
          "text": "receive~ sc_star_mix"
        }
      },
      {
        "box": {
          "id": "phaser",
          "maxclass": "newobj",
          "patching_rect": [
            160,
            850,
            120,
            22
          ],
          "text": "abl.dsp.phaser~"
        }
      },
      {
        "box": {
          "id": "tides",
          "maxclass": "newobj",
          "patching_rect": [
            300,
            850,
            120,
            22
          ],
          "text": "abl.dsp.tides~"
        }
      },
      {
        "box": {
          "id": "tgain",
          "maxclass": "newobj",
          "patching_rect": [
            440,
            850,
            70,
            22
          ],
          "text": "*~ 0.06"
        }
      },
      {
        "box": {
          "id": "tsend",
          "maxclass": "newobj",
          "patching_rect": [
            530,
            850,
            190,
            22
          ],
          "text": "send~ sc_taewan_optional_mix"
        }
      },
      {
        "box": {
          "id": "ableton",
          "maxclass": "comment",
          "patching_rect": [
            10,
            882,
            760,
            22
          ],
          "text": "Optional Taewan audio effects branch. Native-Max mix remains the required fallback if Ableton objects are unavailable."
        }
      },
      {
        "box": {
          "id": "label0",
          "maxclass": "comment",
          "patching_rect": [
            10,
            240,
            335,
            20
          ],
          "text": "star 0: Taewan-style translucent plane + accent, driven by real star metadata"
        }
      },
      {
        "box": {
          "id": "unpack0",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            270,
            110,
            22
          ],
          "text": "unpack f f f f"
        }
      },
      {
        "box": {
          "id": "sx0",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            302,
            150,
            22
          ],
          "text": "scale 0. 1. -1.05 1.05"
        }
      },
      {
        "box": {
          "id": "sy0",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            302,
            150,
            22
          ],
          "text": "scale 0. 1. 0.68 -0.68"
        }
      },
      {
        "box": {
          "id": "pos0",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            334,
            165,
            22
          ],
          "text": "pak position 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "ampWide0",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            334,
            150,
            22
          ],
          "text": "scale 0. 1. 0.24 0.88"
        }
      },
      {
        "box": {
          "id": "ampThin0",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            366,
            155,
            22
          ],
          "text": "scale 0. 1. 0.018 0.085"
        }
      },
      {
        "box": {
          "id": "scale0",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            366,
            170,
            22
          ],
          "text": "pak scale 0.42 0.04 1."
        }
      },
      {
        "box": {
          "id": "alpha0",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            398,
            150,
            22
          ],
          "text": "scale 0. 1. 0.42 0.92"
        }
      },
      {
        "box": {
          "id": "color0",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            398,
            170,
            22
          ],
          "text": "prepend color 1.00 0.38 0.78"
        }
      },
      {
        "box": {
          "id": "rot0",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            430,
            165,
            22
          ],
          "text": "scale 80. 900. -135. 135."
        }
      },
      {
        "box": {
          "id": "rotpak0",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            430,
            170,
            22
          ],
          "text": "pak rotatexyz 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "plane0",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            470,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape plane @position -0.82 0.34 0. @scale 0.46 0.035 1. @rotatexyz 0. 0. 18. @color 1.00 0.38 0.78 0.68 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "accent0",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            500,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape cube @position -0.82 0.34 0.02 @scale 0.055 0.055 0.055 @rotatexyz 0. 0. 18. @color 1.00 0.38 0.78 0.50 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "label1",
          "maxclass": "comment",
          "patching_rect": [
            380,
            240,
            335,
            20
          ],
          "text": "star 1: Taewan-style translucent plane + accent, driven by real star metadata"
        }
      },
      {
        "box": {
          "id": "unpack1",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            270,
            110,
            22
          ],
          "text": "unpack f f f f"
        }
      },
      {
        "box": {
          "id": "sx1",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            302,
            150,
            22
          ],
          "text": "scale 0. 1. -1.05 1.05"
        }
      },
      {
        "box": {
          "id": "sy1",
          "maxclass": "newobj",
          "patching_rect": [
            540,
            302,
            150,
            22
          ],
          "text": "scale 0. 1. 0.68 -0.68"
        }
      },
      {
        "box": {
          "id": "pos1",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            334,
            165,
            22
          ],
          "text": "pak position 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "ampWide1",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            334,
            150,
            22
          ],
          "text": "scale 0. 1. 0.24 0.88"
        }
      },
      {
        "box": {
          "id": "ampThin1",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            366,
            155,
            22
          ],
          "text": "scale 0. 1. 0.018 0.085"
        }
      },
      {
        "box": {
          "id": "scale1",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            366,
            170,
            22
          ],
          "text": "pak scale 0.42 0.04 1."
        }
      },
      {
        "box": {
          "id": "alpha1",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            398,
            150,
            22
          ],
          "text": "scale 0. 1. 0.42 0.92"
        }
      },
      {
        "box": {
          "id": "color1",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            398,
            170,
            22
          ],
          "text": "prepend color 0.18 0.72 1.00"
        }
      },
      {
        "box": {
          "id": "rot1",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            430,
            165,
            22
          ],
          "text": "scale 80. 900. -135. 135."
        }
      },
      {
        "box": {
          "id": "rotpak1",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            430,
            170,
            22
          ],
          "text": "pak rotatexyz 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "plane1",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            470,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape plane @position -0.55 -0.18 0. @scale 0.52 0.025 1. @rotatexyz 0. 0. -32. @color 0.18 0.72 1.00 0.68 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "accent1",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            500,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape cone @position -0.55 -0.18 0.02 @scale 0.055 0.055 0.055 @rotatexyz 0. 0. -32. @color 0.18 0.72 1.00 0.50 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "label2",
          "maxclass": "comment",
          "patching_rect": [
            750,
            240,
            335,
            20
          ],
          "text": "star 2: Taewan-style translucent plane + accent, driven by real star metadata"
        }
      },
      {
        "box": {
          "id": "unpack2",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            270,
            110,
            22
          ],
          "text": "unpack f f f f"
        }
      },
      {
        "box": {
          "id": "sx2",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            302,
            150,
            22
          ],
          "text": "scale 0. 1. -1.05 1.05"
        }
      },
      {
        "box": {
          "id": "sy2",
          "maxclass": "newobj",
          "patching_rect": [
            910,
            302,
            150,
            22
          ],
          "text": "scale 0. 1. 0.68 -0.68"
        }
      },
      {
        "box": {
          "id": "pos2",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            334,
            165,
            22
          ],
          "text": "pak position 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "ampWide2",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            334,
            150,
            22
          ],
          "text": "scale 0. 1. 0.24 0.88"
        }
      },
      {
        "box": {
          "id": "ampThin2",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            366,
            155,
            22
          ],
          "text": "scale 0. 1. 0.018 0.085"
        }
      },
      {
        "box": {
          "id": "scale2",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            366,
            170,
            22
          ],
          "text": "pak scale 0.42 0.04 1."
        }
      },
      {
        "box": {
          "id": "alpha2",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            398,
            150,
            22
          ],
          "text": "scale 0. 1. 0.42 0.92"
        }
      },
      {
        "box": {
          "id": "color2",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            398,
            170,
            22
          ],
          "text": "prepend color 1.00 0.78 0.18"
        }
      },
      {
        "box": {
          "id": "rot2",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            430,
            165,
            22
          ],
          "text": "scale 80. 900. -135. 135."
        }
      },
      {
        "box": {
          "id": "rotpak2",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            430,
            170,
            22
          ],
          "text": "pak rotatexyz 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "plane2",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            470,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape plane @position -0.17 0.48 0. @scale 0.34 0.05 1. @rotatexyz 0. 0. 63. @color 1.00 0.78 0.18 0.68 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "accent2",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            500,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape cube @position -0.17 0.48 0.02 @scale 0.055 0.055 0.055 @rotatexyz 0. 0. 63. @color 1.00 0.78 0.18 0.50 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "label3",
          "maxclass": "comment",
          "patching_rect": [
            10,
            430,
            335,
            20
          ],
          "text": "star 3: Taewan-style translucent plane + accent, driven by real star metadata"
        }
      },
      {
        "box": {
          "id": "unpack3",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            460,
            110,
            22
          ],
          "text": "unpack f f f f"
        }
      },
      {
        "box": {
          "id": "sx3",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            492,
            150,
            22
          ],
          "text": "scale 0. 1. -1.05 1.05"
        }
      },
      {
        "box": {
          "id": "sy3",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            492,
            150,
            22
          ],
          "text": "scale 0. 1. 0.68 -0.68"
        }
      },
      {
        "box": {
          "id": "pos3",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            524,
            165,
            22
          ],
          "text": "pak position 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "ampWide3",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            524,
            150,
            22
          ],
          "text": "scale 0. 1. 0.24 0.88"
        }
      },
      {
        "box": {
          "id": "ampThin3",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            556,
            155,
            22
          ],
          "text": "scale 0. 1. 0.018 0.085"
        }
      },
      {
        "box": {
          "id": "scale3",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            556,
            170,
            22
          ],
          "text": "pak scale 0.42 0.04 1."
        }
      },
      {
        "box": {
          "id": "alpha3",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            588,
            150,
            22
          ],
          "text": "scale 0. 1. 0.42 0.92"
        }
      },
      {
        "box": {
          "id": "color3",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            588,
            170,
            22
          ],
          "text": "prepend color 0.25 1.00 0.80"
        }
      },
      {
        "box": {
          "id": "rot3",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            620,
            165,
            22
          ],
          "text": "scale 80. 900. -135. 135."
        }
      },
      {
        "box": {
          "id": "rotpak3",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            620,
            170,
            22
          ],
          "text": "pak rotatexyz 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "plane3",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            660,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape plane @position 0.18 -0.28 0. @scale 0.44 0.032 1. @rotatexyz 0. 0. -72. @color 0.25 1.00 0.80 0.68 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "accent3",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            690,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape cylinder @position 0.18 -0.28 0.02 @scale 0.055 0.055 0.055 @rotatexyz 0. 0. -72. @color 0.25 1.00 0.80 0.50 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "label4",
          "maxclass": "comment",
          "patching_rect": [
            380,
            430,
            335,
            20
          ],
          "text": "star 4: Taewan-style translucent plane + accent, driven by real star metadata"
        }
      },
      {
        "box": {
          "id": "unpack4",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            460,
            110,
            22
          ],
          "text": "unpack f f f f"
        }
      },
      {
        "box": {
          "id": "sx4",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            492,
            150,
            22
          ],
          "text": "scale 0. 1. -1.05 1.05"
        }
      },
      {
        "box": {
          "id": "sy4",
          "maxclass": "newobj",
          "patching_rect": [
            540,
            492,
            150,
            22
          ],
          "text": "scale 0. 1. 0.68 -0.68"
        }
      },
      {
        "box": {
          "id": "pos4",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            524,
            165,
            22
          ],
          "text": "pak position 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "ampWide4",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            524,
            150,
            22
          ],
          "text": "scale 0. 1. 0.24 0.88"
        }
      },
      {
        "box": {
          "id": "ampThin4",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            556,
            155,
            22
          ],
          "text": "scale 0. 1. 0.018 0.085"
        }
      },
      {
        "box": {
          "id": "scale4",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            556,
            170,
            22
          ],
          "text": "pak scale 0.42 0.04 1."
        }
      },
      {
        "box": {
          "id": "alpha4",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            588,
            150,
            22
          ],
          "text": "scale 0. 1. 0.42 0.92"
        }
      },
      {
        "box": {
          "id": "color4",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            588,
            170,
            22
          ],
          "text": "prepend color 1.00 0.28 0.24"
        }
      },
      {
        "box": {
          "id": "rot4",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            620,
            165,
            22
          ],
          "text": "scale 80. 900. -135. 135."
        }
      },
      {
        "box": {
          "id": "rotpak4",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            620,
            170,
            22
          ],
          "text": "pak rotatexyz 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "plane4",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            660,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape plane @position 0.54 0.25 0. @scale 0.38 0.042 1. @rotatexyz 0. 0. 38. @color 1.00 0.28 0.24 0.68 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "accent4",
          "maxclass": "newobj",
          "patching_rect": [
            380,
            690,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape cube @position 0.54 0.25 0.02 @scale 0.055 0.055 0.055 @rotatexyz 0. 0. 38. @color 1.00 0.28 0.24 0.50 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "label5",
          "maxclass": "comment",
          "patching_rect": [
            750,
            430,
            335,
            20
          ],
          "text": "star 5: Taewan-style translucent plane + accent, driven by real star metadata"
        }
      },
      {
        "box": {
          "id": "unpack5",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            460,
            110,
            22
          ],
          "text": "unpack f f f f"
        }
      },
      {
        "box": {
          "id": "sx5",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            492,
            150,
            22
          ],
          "text": "scale 0. 1. -1.05 1.05"
        }
      },
      {
        "box": {
          "id": "sy5",
          "maxclass": "newobj",
          "patching_rect": [
            910,
            492,
            150,
            22
          ],
          "text": "scale 0. 1. 0.68 -0.68"
        }
      },
      {
        "box": {
          "id": "pos5",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            524,
            165,
            22
          ],
          "text": "pak position 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "ampWide5",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            524,
            150,
            22
          ],
          "text": "scale 0. 1. 0.24 0.88"
        }
      },
      {
        "box": {
          "id": "ampThin5",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            556,
            155,
            22
          ],
          "text": "scale 0. 1. 0.018 0.085"
        }
      },
      {
        "box": {
          "id": "scale5",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            556,
            170,
            22
          ],
          "text": "pak scale 0.42 0.04 1."
        }
      },
      {
        "box": {
          "id": "alpha5",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            588,
            150,
            22
          ],
          "text": "scale 0. 1. 0.42 0.92"
        }
      },
      {
        "box": {
          "id": "color5",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            588,
            170,
            22
          ],
          "text": "prepend color 0.66 0.48 1.00"
        }
      },
      {
        "box": {
          "id": "rot5",
          "maxclass": "newobj",
          "patching_rect": [
            930,
            620,
            165,
            22
          ],
          "text": "scale 80. 900. -135. 135."
        }
      },
      {
        "box": {
          "id": "rotpak5",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            620,
            170,
            22
          ],
          "text": "pak rotatexyz 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "plane5",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            660,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape plane @position 0.84 -0.18 0. @scale 0.48 0.028 1. @rotatexyz 0. 0. -12. @color 0.66 0.48 1.00 0.68 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "accent5",
          "maxclass": "newobj",
          "patching_rect": [
            750,
            690,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape cone @position 0.84 -0.18 0.02 @scale 0.055 0.055 0.055 @rotatexyz 0. 0. -12. @color 0.66 0.48 1.00 0.50 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "label6",
          "maxclass": "comment",
          "patching_rect": [
            10,
            620,
            335,
            20
          ],
          "text": "star 6: Taewan-style translucent plane + accent, driven by real star metadata"
        }
      },
      {
        "box": {
          "id": "unpack6",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            650,
            110,
            22
          ],
          "text": "unpack f f f f"
        }
      },
      {
        "box": {
          "id": "sx6",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            682,
            150,
            22
          ],
          "text": "scale 0. 1. -1.05 1.05"
        }
      },
      {
        "box": {
          "id": "sy6",
          "maxclass": "newobj",
          "patching_rect": [
            170,
            682,
            150,
            22
          ],
          "text": "scale 0. 1. 0.68 -0.68"
        }
      },
      {
        "box": {
          "id": "pos6",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            714,
            165,
            22
          ],
          "text": "pak position 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "ampWide6",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            714,
            150,
            22
          ],
          "text": "scale 0. 1. 0.24 0.88"
        }
      },
      {
        "box": {
          "id": "ampThin6",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            746,
            155,
            22
          ],
          "text": "scale 0. 1. 0.018 0.085"
        }
      },
      {
        "box": {
          "id": "scale6",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            746,
            170,
            22
          ],
          "text": "pak scale 0.42 0.04 1."
        }
      },
      {
        "box": {
          "id": "alpha6",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            778,
            150,
            22
          ],
          "text": "scale 0. 1. 0.42 0.92"
        }
      },
      {
        "box": {
          "id": "color6",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            778,
            170,
            22
          ],
          "text": "prepend color 0.86 0.95 1.00"
        }
      },
      {
        "box": {
          "id": "rot6",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            810,
            165,
            22
          ],
          "text": "scale 80. 900. -135. 135."
        }
      },
      {
        "box": {
          "id": "rotpak6",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            810,
            170,
            22
          ],
          "text": "pak rotatexyz 0. 0. 0."
        }
      },
      {
        "box": {
          "id": "plane6",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            850,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape plane @position 0.02 0.02 0. @scale 0.64 0.02 1. @rotatexyz 0. 0. 92. @color 0.86 0.95 1.00 0.68 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "accent6",
          "maxclass": "newobj",
          "patching_rect": [
            10,
            880,
            330,
            22
          ],
          "text": "jit.gl.gridshape sc_visual @shape cube @position 0.02 0.02 0.02 @scale 0.055 0.055 0.055 @rotatexyz 0. 0. 92. @color 0.86 0.95 1.00 0.50 @blend_enable 1 @depth_enable 0"
        }
      },
      {
        "box": {
          "id": "passEnable",
          "maxclass": "message",
          "text": "enable 1",
          "patching_rect": [
            580,
            160,
            80,
            22
          ]
        }
      },
      {
        "box": {
          "id": "passNote",
          "maxclass": "comment",
          "text": "Bloom and motionglitch are kept as Taewan-style optional passes. Dynamic pass attrs are disabled because this Max install rejected guessed attr names.",
          "patching_rect": [
            10,
            220,
            900,
            22
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "cmd",
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
            "lb",
            0
          ],
          "destination": [
            "worldMsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "worldMsg",
            0
          ],
          "destination": [
            "world",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "lb",
            0
          ],
          "destination": [
            "animSeed",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "animSeed",
            0
          ],
          "destination": [
            "anim",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "taudio",
            0
          ],
          "destination": [
            "phaser",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "phaser",
            0
          ],
          "destination": [
            "tides",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "tides",
            0
          ],
          "destination": [
            "tgain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "tgain",
            0
          ],
          "destination": [
            "tsend",
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
            "unpack0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack0",
            0
          ],
          "destination": [
            "sx0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack0",
            1
          ],
          "destination": [
            "sy0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sx0",
            0
          ],
          "destination": [
            "pos0",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sy0",
            0
          ],
          "destination": [
            "pos0",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos0",
            0
          ],
          "destination": [
            "plane0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos0",
            0
          ],
          "destination": [
            "accent0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack0",
            2
          ],
          "destination": [
            "ampWide0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack0",
            2
          ],
          "destination": [
            "ampThin0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampWide0",
            0
          ],
          "destination": [
            "scale0",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampThin0",
            0
          ],
          "destination": [
            "scale0",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scale0",
            0
          ],
          "destination": [
            "plane0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack0",
            2
          ],
          "destination": [
            "alpha0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "alpha0",
            0
          ],
          "destination": [
            "color0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color0",
            0
          ],
          "destination": [
            "plane0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color0",
            0
          ],
          "destination": [
            "accent0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack0",
            3
          ],
          "destination": [
            "rot0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rot0",
            0
          ],
          "destination": [
            "rotpak0",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak0",
            0
          ],
          "destination": [
            "plane0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak0",
            0
          ],
          "destination": [
            "accent0",
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
            "unpack1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack1",
            0
          ],
          "destination": [
            "sx1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack1",
            1
          ],
          "destination": [
            "sy1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sx1",
            0
          ],
          "destination": [
            "pos1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sy1",
            0
          ],
          "destination": [
            "pos1",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos1",
            0
          ],
          "destination": [
            "plane1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos1",
            0
          ],
          "destination": [
            "accent1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack1",
            2
          ],
          "destination": [
            "ampWide1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack1",
            2
          ],
          "destination": [
            "ampThin1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampWide1",
            0
          ],
          "destination": [
            "scale1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampThin1",
            0
          ],
          "destination": [
            "scale1",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scale1",
            0
          ],
          "destination": [
            "plane1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack1",
            2
          ],
          "destination": [
            "alpha1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "alpha1",
            0
          ],
          "destination": [
            "color1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color1",
            0
          ],
          "destination": [
            "plane1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color1",
            0
          ],
          "destination": [
            "accent1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack1",
            3
          ],
          "destination": [
            "rot1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rot1",
            0
          ],
          "destination": [
            "rotpak1",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak1",
            0
          ],
          "destination": [
            "plane1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak1",
            0
          ],
          "destination": [
            "accent1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            2
          ],
          "destination": [
            "unpack2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack2",
            0
          ],
          "destination": [
            "sx2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack2",
            1
          ],
          "destination": [
            "sy2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sx2",
            0
          ],
          "destination": [
            "pos2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sy2",
            0
          ],
          "destination": [
            "pos2",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos2",
            0
          ],
          "destination": [
            "plane2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos2",
            0
          ],
          "destination": [
            "accent2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack2",
            2
          ],
          "destination": [
            "ampWide2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack2",
            2
          ],
          "destination": [
            "ampThin2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampWide2",
            0
          ],
          "destination": [
            "scale2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampThin2",
            0
          ],
          "destination": [
            "scale2",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scale2",
            0
          ],
          "destination": [
            "plane2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack2",
            2
          ],
          "destination": [
            "alpha2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "alpha2",
            0
          ],
          "destination": [
            "color2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color2",
            0
          ],
          "destination": [
            "plane2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color2",
            0
          ],
          "destination": [
            "accent2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack2",
            3
          ],
          "destination": [
            "rot2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rot2",
            0
          ],
          "destination": [
            "rotpak2",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak2",
            0
          ],
          "destination": [
            "plane2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak2",
            0
          ],
          "destination": [
            "accent2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            3
          ],
          "destination": [
            "unpack3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack3",
            0
          ],
          "destination": [
            "sx3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack3",
            1
          ],
          "destination": [
            "sy3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sx3",
            0
          ],
          "destination": [
            "pos3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sy3",
            0
          ],
          "destination": [
            "pos3",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos3",
            0
          ],
          "destination": [
            "plane3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos3",
            0
          ],
          "destination": [
            "accent3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack3",
            2
          ],
          "destination": [
            "ampWide3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack3",
            2
          ],
          "destination": [
            "ampThin3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampWide3",
            0
          ],
          "destination": [
            "scale3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampThin3",
            0
          ],
          "destination": [
            "scale3",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scale3",
            0
          ],
          "destination": [
            "plane3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack3",
            2
          ],
          "destination": [
            "alpha3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "alpha3",
            0
          ],
          "destination": [
            "color3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color3",
            0
          ],
          "destination": [
            "plane3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color3",
            0
          ],
          "destination": [
            "accent3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack3",
            3
          ],
          "destination": [
            "rot3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rot3",
            0
          ],
          "destination": [
            "rotpak3",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak3",
            0
          ],
          "destination": [
            "plane3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak3",
            0
          ],
          "destination": [
            "accent3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            4
          ],
          "destination": [
            "unpack4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack4",
            0
          ],
          "destination": [
            "sx4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack4",
            1
          ],
          "destination": [
            "sy4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sx4",
            0
          ],
          "destination": [
            "pos4",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sy4",
            0
          ],
          "destination": [
            "pos4",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos4",
            0
          ],
          "destination": [
            "plane4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos4",
            0
          ],
          "destination": [
            "accent4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack4",
            2
          ],
          "destination": [
            "ampWide4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack4",
            2
          ],
          "destination": [
            "ampThin4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampWide4",
            0
          ],
          "destination": [
            "scale4",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampThin4",
            0
          ],
          "destination": [
            "scale4",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scale4",
            0
          ],
          "destination": [
            "plane4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack4",
            2
          ],
          "destination": [
            "alpha4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "alpha4",
            0
          ],
          "destination": [
            "color4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color4",
            0
          ],
          "destination": [
            "plane4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color4",
            0
          ],
          "destination": [
            "accent4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack4",
            3
          ],
          "destination": [
            "rot4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rot4",
            0
          ],
          "destination": [
            "rotpak4",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak4",
            0
          ],
          "destination": [
            "plane4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak4",
            0
          ],
          "destination": [
            "accent4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            5
          ],
          "destination": [
            "unpack5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack5",
            0
          ],
          "destination": [
            "sx5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack5",
            1
          ],
          "destination": [
            "sy5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sx5",
            0
          ],
          "destination": [
            "pos5",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sy5",
            0
          ],
          "destination": [
            "pos5",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos5",
            0
          ],
          "destination": [
            "plane5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos5",
            0
          ],
          "destination": [
            "accent5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack5",
            2
          ],
          "destination": [
            "ampWide5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack5",
            2
          ],
          "destination": [
            "ampThin5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampWide5",
            0
          ],
          "destination": [
            "scale5",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampThin5",
            0
          ],
          "destination": [
            "scale5",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scale5",
            0
          ],
          "destination": [
            "plane5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack5",
            2
          ],
          "destination": [
            "alpha5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "alpha5",
            0
          ],
          "destination": [
            "color5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color5",
            0
          ],
          "destination": [
            "plane5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color5",
            0
          ],
          "destination": [
            "accent5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack5",
            3
          ],
          "destination": [
            "rot5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rot5",
            0
          ],
          "destination": [
            "rotpak5",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak5",
            0
          ],
          "destination": [
            "plane5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak5",
            0
          ],
          "destination": [
            "accent5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            6
          ],
          "destination": [
            "unpack6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack6",
            0
          ],
          "destination": [
            "sx6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack6",
            1
          ],
          "destination": [
            "sy6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sx6",
            0
          ],
          "destination": [
            "pos6",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sy6",
            0
          ],
          "destination": [
            "pos6",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos6",
            0
          ],
          "destination": [
            "plane6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pos6",
            0
          ],
          "destination": [
            "accent6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack6",
            2
          ],
          "destination": [
            "ampWide6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack6",
            2
          ],
          "destination": [
            "ampThin6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampWide6",
            0
          ],
          "destination": [
            "scale6",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampThin6",
            0
          ],
          "destination": [
            "scale6",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scale6",
            0
          ],
          "destination": [
            "plane6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack6",
            2
          ],
          "destination": [
            "alpha6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "alpha6",
            0
          ],
          "destination": [
            "color6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color6",
            0
          ],
          "destination": [
            "plane6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "color6",
            0
          ],
          "destination": [
            "accent6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack6",
            3
          ],
          "destination": [
            "rot6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rot6",
            0
          ],
          "destination": [
            "rotpak6",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak6",
            0
          ],
          "destination": [
            "plane6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "rotpak6",
            0
          ],
          "destination": [
            "accent6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "lb",
            0
          ],
          "destination": [
            "passEnable",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "passEnable",
            0
          ],
          "destination": [
            "motion",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "passEnable",
            0
          ],
          "destination": [
            "bloom",
            0
          ]
        }
      }
    ]
  }
}