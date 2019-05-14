#include "HsFFI.h"
#include <stdio.h>
#include <gdnative/gdnative.h>
#include <pluginscript/godot_pluginscript.h>
#include <gdnative_api_struct.gen.h>
#include <stdlib.h>

static void flib_init() __attribute__((constructor));
static void flib_init() {
  static char *argv[] = { "libGodotHaskellPlugin.so", 0 }, **argv_ = argv;
  static int argc = 1;
  hs_init(&argc, &argv_);
}

static void flib_fini() __attribute__((destructor));
static void flib_fini() {
  hs_exit();
}
