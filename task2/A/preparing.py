code = """#ifndef HELL_H
#define HELL_H
int n = 1;
#endif"""
my_file = open("index.h", "w+")
my_file.write(code)
my_file.close()
