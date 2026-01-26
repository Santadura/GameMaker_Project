if (!file_exists("record.ini")) {
    ini_open("record.ini");
    ini_write_real("record", "best_time", 999999);
    ini_write_real("record", "best_point", 0);
    ini_close();
}

ini_open("record.ini");

best_time = ini_read_real("record", "best_time", 999999);
best_point = ini_read_real("record", "best_point", 0);

ini_close();