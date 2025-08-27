{ config, pkgs, ... }:

{
  services.moonraker = {
    enable = true;
    address = "0.0.0.0";
    port = 7125;
    klipperSocket = "/run/klipper/api";
    user = "root";
    group = "root";

    settings = {
      file_manager = {
        enable_object_processing = true;
      };

      octoprint_compat = {};
      history = {};
      authorization = {
        force_logins = false;

        cors_domains = [
          "*://localhost"
          "*://mjolnir"
        ];

        trusted_clients = [
          "127.0.0.0/8"
          "192.168.2.0/24"
          "192.168.88.0/24"
        ];
      };
    };
  };

  services.fluidd = {
    enable = true;
  };

  services.nginx = {
    clientMaxBodySize = "1000m";
  };

  services.klipper = {
    enable = true;
    logFile = "/var/log/klipper.log";
    user = "root";
    group = "root";

    settings = {
      printer = {
        kinematics = "cartesian";
        max_velocity = 300;
        max_accel = 3000;
        max_z_velocity = 5;
        max_z_accel = 100;
      };

      mcu = {
        serial = "/dev/serial/by-id/usb-1a86_USB_Serial-if00-port0";
        restart_method = "command";
      };

      stepper_x = {
        step_pin = "PC2";
        dir_pin = "PB9";
        enable_pin = "!PC3";
        microsteps = 16;
        rotation_distance = 40;
        endstop_pin = "^PA5";
        position_endstop = 0;
        position_max = 247;
        homing_speed = 50;
      };

      stepper_y = {
        step_pin = "PB8";
        dir_pin = "PB7";
        enable_pin = "!PC3";
        microsteps = 16;
        rotation_distance = 40;
        endstop_pin = "^PA6";
        position_endstop = 2;
        position_max = 226;
        position_min = 2;
        homing_speed = 50;
      };

      stepper_z = {
        step_pin = "PB6";
        dir_pin = "!PB5";
        enable_pin = "!PC3";
        microsteps = 16;
        rotation_distance = 8;
        endstop_pin = "probe:z_virtual_endstop";
        position_max = 250;
        position_min = -6;
      };

      extruder = {
        max_extrude_only_distance = 101.0;
        step_pin = "PB4";
        dir_pin = "PB3";
        enable_pin = "!PC3";
        microsteps = 16;
        rotation_distance = 32.34164;
        nozzle_diameter = 0.400;
        filament_diameter = 1.750;
        heater_pin = "PA1";
        sensor_type = "EPCOS 100K B57560G104F";
        sensor_pin = "PC5";
        control = "pid";
        pid_Kp = 35.435;
        pid_Ki = 5.906;
        pid_Kd = 53.152;
        min_temp = 0;
        max_temp = 250;
      };

      heater_bed = {
        heater_pin = "PA2";
        sensor_type = "EPCOS 100K B57560G104F";
        sensor_pin = "PC4";
        control = "pid";
        pid_Kp = 75.380;
        pid_Ki = 1.698;
        pid_Kd = 836.717;
        min_temp = 0;
        max_temp = 70;
      };

      fan = {
        pin = "PA0";
      };

      virtual_sdcard = {
        path = "/var/lib/moonraker/gcodes";
      };

      display_status = {};
      pause_resume = {};

      "gcode_macro PURGE_LINE" = {
        description = "Cura purge line";
        gcode = "
          G92 E0
          G1 Z2.0 F3000
          G1 X0.1 Y20 Z0.3 F5000.0
          G1 X0.1 Y200 Z0.3 F1500 E15
          G1 X0.4 Y200 Z0.3 F5000
          G1 X0.4 Y20 Z0.3 F1500 E30
          G92 E0
        ";
      };

      "gcode_macro CANCEL_PRINT" = {
        description = "Cancel the running print.";
        rename_existing = "CANCEL_PRINT_BASE";
        gcode = "
          TURN_OFF_HEATERS
          CANCEL_PRINT_BASE
          G1 X0 Y210 F5000
        ";
      };

      "gcode_macro START_PRINT" = {
        gcode = "
          {% set BED_TEMP = params.BED_TEMP|default(60)|float %}
          {% set EXTRUDER_TEMP = params.EXTRUDER_TEMP|default(200)|float %}

          M140 S{BED_TEMP}
          G90
          SET_GCODE_OFFSET Z=0.0
          G28
          G1 Z5 F3000
          G1 Z0.15 F300
          M190 S{BED_TEMP}
          BED_MESH_CALIBRATE ADAPTIVE=1

          M109 S{EXTRUDER_TEMP}
          PURGE_LINE
        ";
      };

      "gcode_macro END_PRINT" = {
        gcode = "
          M140 S0
          M104 S0
          M106 S0
          G91
          G1 X-2 Y-2 E-3 F300
          G1 Z10 F300
          G90
          G1 X0 Y210 F5000
          M84
        ";
      };

      "gcode_macro PIN_DOWN" = {
        gcode = "
          BLTOUCH_DEBUG COMMAND=pin_down
        ";
      };

      safe_z_home = {
        home_xy_position = "110,110";
        speed = 50;
        z_hop = 10;
        z_hop_speed = 5;
      };

      bltouch = {
        sensor_pin = "^PB1";
        control_pin = "PB0";
        samples = 2;
        speed = 2;
        x_offset = -42.5;
        y_offset = -6;
        z_offset = 3.349;
      };

      bed_mesh = {
        speed = 80;
        horizontal_move_z = 5;
        mesh_min = "10,10";
        mesh_max = "204.5,205";
        probe_count = "5,5";
        adaptive_margin = 5;
      };

      screws_tilt_adjust = {
        screw1 = "70,30";
        screw1_name = "front left screw";
        screw2 = "240,30";
        screw2_name = "front right screw";
        screw3 = "240,200";
        screw3_name = "rear right screw";
        screw4 = "70,200";
        screw4_name = "rear left screw";
        screw_thread = "CW-M4";
        horizontal_move_z = 10;
        speed = 50;
      };

      exclude_object = {};
    };
  };
}
