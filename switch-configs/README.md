# Switch configurations for Openfest 2017

## General port layout
The following scheme is followed:

 * Last copper port on the switch is UPLINK
   * Uplink is trunk mode with access as a minimum to mgmt vlan (20) and purpose speciffic vlan (e.g. video (23))
 * First copper port on the switch is PHONE (if such are required)
   * mode is access
   * VLAN 25
 * Next up to 6 ports are for speciffic purposes (e.g. video related, general access, etc)
   * Mode is access (unless specific equipment requires other. e.g. wifi is connected to this port)
   * VLAN varies

## Exception from the scheme
There are 4 exceptions from the scheme:
 * coresw - links all the rest so it is expected to be different
   * Uplink is last 2 copper ports (47, 48)
   * Ports 41 to 46 are reserved for internal services
   * Downlinks to switches are on ports 1-6
   * Presenters wired access is on port 7-9
   * WIFI access is as follows:
     * Ports 11 and 12 are trunked and go to PoE switch.
     * Ports 12-18 are for dedicated WIFI AP's
 * nocsw - needs easy access to all vlans on ports so all vlans are present there
   * Multiple ports per vlan are present
   * Port 1,2 - Phone access
   * Port 3,4 - External vlan access
   * Port 5,6 - mgmt vlan
   * Port 7,8 - wired vlan
   * Port 9,10 - wireless vlan
   * Port 11-14 - video vlan - monitoring stations to be put
   * Port 15,16 - overflow vlan
   * Port 17-22 - shutdown (spare). NOC can use as wanted.
   * Port 23,24 - UPLINK
 * connectionsw - special switch to do media conversion between Single and Multi-mode optic
   * Ports 9 and 10 are fiber
   * Might not have IP (or any other config for that matter)
   * All copper ports are shutdown
 * fl2sw - switch located in floor 2 (-1) to facilitate own equipment usage
   * last 2 ports are trunked uplink
