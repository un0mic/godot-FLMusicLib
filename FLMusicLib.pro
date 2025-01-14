TEMPLATE = lib
CONFIG += c++14
CONFIG -= app_bundle
CONFIG -= qt
CONFIG += dyanmiclib

SOURCES += \
    src/init.cpp \
    src/audiosampler.cpp \
    src/gmesampler.cpp \
    src/mp3sampler.cpp \
    src/musicplayer.cpp \
    src/openmptsampler.cpp

HEADERS += \
    src/audiosampler.h \
    src/gmesampler.h \
    src/mp3sampler.h \
    src/musicplayer.h \
    src/openmptsampler.h

INCLUDEPATH += $$PWD/include
INCLUDEPATH += $$PWD/godot-cpp
INCLUDEPATH += $$PWD/godot-cpp/godot_headers
INCLUDEPATH += $$PWD/godot-cpp/include
INCLUDEPATH += $$PWD/godot-cpp/include/core
INCLUDEPATH += $$PWD/godot-cpp/include/gen

INCLUDEPATH += $$PWD/src
INCLUDEPATH += $$PWD/godot-cpp/bin
PRE_TARGETDEPS += $$PWD/../

QMAKE_CXXFLAGS_RELEASE += -fPIC

win32:contains(QMAKE_TARGET.arch, x86_64){
    INCLUDEPATH += $$PWD/include/openmpt
    LIBS += "$$PWD/lib/windows/x64/libgme.lib"
    #LIBS += "$$PWD/lib/windows/x64/libsoundio.dll.a"
    #LIBS += "$$PWD/lib/windows/x64/libsoundio.a"
    LIBS += "$$PWD/lib/windows/x64/libgodot-cpp.windows.release.64.lib"
    LIBS += "$$PWD/lib/windows/x64/libopenmpt.lib"
}

win32:contains(QMAKE_TARGET.arch, x86){
    INCLUDEPATH += $$PWD/include/openmpt
    LIBS += "$$PWD/lib/windows/x86/libgme.lib"
    #LIBS += "$$PWD/lib/windows/x86/libsoundio.dll.a"
    #LIBS += "$$PWD/lib/windows/x86/libsoundio.a"
    LIBS += "$$PWD/lib/windows/x86/libgodot-cpp.windows.release.32.lib"
    LIBS += "$$PWD/lib/windows/x86/libopenmpt.lib"
}

linux:{
    #LIBS += -L/home/Fabian/Documents/Godot/GDNative/libsound/libsoundio/Build/ -lsoundio
    PRE_TARGETDEPS += $$PWD/godot-cpp/bin/libgodot-cpp.linux.release.64.a
    LIBS += -L$$PWD/godot-cpp/bin
    LIBS += -lgodot-cpp.linux.release.64
    LIBS += -lopenmpt
    PRE_TARGETDEPS += $$PWD/lib/linux/x64/libgme.a
    LIBS += -L$$PWD/lib/linux/x64
    LIBS += -lgme

}





