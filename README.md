<a href="https://rbltracker.com" target="_blank">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="https://portal.rbltracker.com/assets/3.14/images/rbltracker_logo_dark.svg" width="400">
        <img src="https://portal.rbltracker.com/assets/3.14/images/rbltracker_logo_light.svg" width="400">
    </picture>
</a>

[Sign up][rbltracker sign up] for a RBLTracker account and visit our [developer site][rbltracker dev site] for even more details.

# RBLTracker Zabbix Plugin

This is a very simple Zabbix plugin, written in bash, to integrate with the RBLTracker public API. This tool uses the command line `curl` tool to make an HTTPs GET request to a specific Zabbix formatted API URL.

This script returns:

* 0 when the "total_listed" value is 0.
* &gt; 0 when the "total_listed" value does not equal 0.
* -1 when there is some other error, like an invalid API token.


## Installation

1. Copy `check_rbltracker.sh` into your Zabbix plugins directory; this is most likely `<zabbix dir>/share/zabbix/externalscripts` depending on your platform.
```
cp check_rbltracker.sh /usr/share/zabbix/externalscripts/
```

2. Make sure `check_rbltracker.sh` is executable:
```
chmod +x check_rbltracker.sh
```

## Zabbix Configuration

1. Import the `rbltracker_zabbix.xml` file, which imports the "RBLTracker Check" template into your Zabbix instance.

2. Edit an existing Host, or add a new Host, and from the Templates tab, link the new "RBLTracker Check" template to this host.

3. From the Macros tab, add a new `{$RBLTRACKER_ACCOUNT_SID}` and `{$RBLTRACKER_API_TOKEN}` Macros; the value for the Macros are your RBLTracker account SID and API token, available from the RBLTracker portal.


[rbltracker sign up]:   https://portal.rbltracker.com/signup/
[rbltracker dev site]:  https://rbltracker.com/docs/api/
