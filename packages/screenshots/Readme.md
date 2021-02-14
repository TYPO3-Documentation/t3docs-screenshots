# Extenison `screenshots`

Used only as helper extension for this projekt.

## Commands

```text
    This extenison provides Symfony commands. (For now - eventually it will get more functionality)
    Which commands exist and how to use them is described in this section.
```

### screenshots:getmapping

This command gets records from DB and writes the UID plus additional fields to an array. The result is saved in a JSON
file, to be used as mapping in puppeteer. With this we can search e.g. for a pages title, to get its UID.

**How to use**

Call the command via TYPO3 console

```bash
./vendor/bin/typo3cms screenshots:getmapping <params>
```

**Parameters:**

* `--table=pages`
    * Defines which table is used (Default: **pages**)
* `--filename=pages.json`
    * Filename to save the data in. Can be a path, relative from `public/Output/json` (Default: **file.json**)
* `--additional-fields="title,pid,description"`
    * The UID field is mapped all the tim, nut you can define multiple fields that are used in addition. Just put all
      commaseparated fieldnames into this parameter. (Default: [**empty string**])

