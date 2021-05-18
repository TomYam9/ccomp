CC=g++
CFLAGS	= -g -static 
TRGS	=main
SRCS	=main.cpp
OBJS	=$(SRCS:%.cpp=%.o)
INCDIR	=-I../inc
LIBDIR  =
LIBS	=

.PHONY: $(TRGS) .cpp.o all test clean

$(TRGS): $(OBJS) #リンク
	$(CC) -o $@ $^ $(LIBDIR) $(LIB)

#$(OBJS): $(SRCS) #実行ファイル生成]
.cpp.o:
	$(CC) $(CFLAGS) $(INCDIR) -c $<

all: clean $(OBJS) $(TRGS)

test: $(TRGS)
	./test.sh

clean:
	-rm -f $(OBJS) $(TRGS) *.d tmp*

