# You may modify Makefile as your like
# but you should keep `make clean` and `make` works correct

PROGRAM = code

CXX = g++
CXXFLAGS = -IStanfordCPPLib -fvisibility-inlines-hidden -g -std=c++11

CPP_FILES = $(wildcard Basic/*.cpp)
H_FILES = $(wildcard Basic/*.h)

LDOPTIONS = -L.
LIB = -lStanfordCPPLib

all: $(PROGRAM) spl.jar

$(PROGRAM): $(CPP_FILES) $(H_FILES) libStanfordCPPLib.a
	$(CXX) -o $(PROGRAM) $(CXXFLAGS) $(LDOPTIONS) $(CPP_FILES) $(LIB)

libStanfordCPPLib.a:
	(make -f makefile-for-judge all)
	ln -s libStanfordCPPLib.a .

spl.jar:
	ln -s spl.jar .

tidy:
	( make -f makefile-for-judge clean)
	rd -f ,* .,* *~ core a.out *.err

clean scratch: tidy
	rd -f *.o *.a $(PROGRAM) spl.jar score
