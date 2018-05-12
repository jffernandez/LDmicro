#!/usr/bin/perl

sub SYS { system($_[0]); }

SYS("rmdir build");
SYS("rm -rf build");
SYS("mkdir build");
SYS("mkdir obj");

foreach $f (qw(DE ES FR IT PT TR RU JA EN)) {
    SYS("nmake clean");
    print $f;
    SYS("nmake D=LDLANG_$f");
    $fl = lc($f);
    SYS("copy ldmicro.exe build\\ldmicro-$fl.exe");
}
SYS("copy ldmicro.exe build\\ldmicro.exe");

SYS("copy COPYING.txt     build");
SYS("copy CHANGES.txt     build");
SYS("copy manual*.txt     build");
SYS("copy clear.bat       build");
SYS("copy notepad.bat     build");
SYS("copy readmcu.bat     build");
SYS("copy flashmcu.bat    build");
SYS("copy postCompile.bat build");

SYS("mkdir build\\LIBRARIES_FOR");
SYS("mkdir build\\LIBRARIES_FOR\\ARDUINO");
SYS("mkdir build\\LIBRARIES_FOR\\ARDUINO\\PwmFrequency");
SYS("copy  LIBRARIES_FOR\\ARDUINO\\PwmFrequency\\PwmFrequency.h   build\\LIBRARIES_FOR\\ARDUINO\\PwmFrequency");
SYS("copy  LIBRARIES_FOR\\ARDUINO\\PwmFrequency\\PwmFrequency.cpp build\\LIBRARIES_FOR\\ARDUINO\\PwmFrequency");
