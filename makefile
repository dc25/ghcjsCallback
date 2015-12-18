OUTPUT_DIR=dist/build/ghcjsCallback/ghcjsCallback.jsexe/

default:all

COPY_FILES = index.html 
DEST_FILES = ${addprefix ${OUTPUT_DIR}, ${COPY_FILES} }

${DEST_FILES} : ${OUTPUT_DIR}%: %
	cp $< $@

cabalbuild: 
	cabal build

all: cabalbuild ${DEST_FILES}

