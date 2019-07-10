#!/bin/zsh

setopt nullglob
/bin/rm -f ./lua_snippets/*
unsetopt nullglob

mkdir -p lua_snippets

typeset -a snippet_files
snippet_files=(./_snippets/*.md)

for file in $snippet_files; do
	perl -0ne '
		use File::Basename;
		while(m/title:[ ]*(.*?)(?:\r\n|\r|\n).*?```lua.*?(?:\r\n|\r|\n)(.*?)```/gs)
		{
			my $lua_code = $2;
			(my $without_extension = basename($ARGV)) =~ s/\.[^.]+$//;
			my $filename = "./lua_snippets/${without_extension}.lua";
			open(my $fh, ">", $filename) or die "Could not open file $filename $!";
			print $fh $lua_code;
			close $fh;
		}
	' $file
done

json_out=$(
	perl -0ne '
		use File::Basename;
		while(m/title:[ ]*(.*?)(?:\r\n|\r|\n).*?```lua(.*?)```/gs)
		{
			my $title = $1;
			$title =~ s/"/\\"/g;
			(my $without_extension = basename($ARGV)) =~ s/\.[^.]+$//;
			printf "\n{\n  \"title\": \"%s\",\n  \"filename\": \"%s\"\n},", $title, $without_extension;
		}
	' $snippet_files
)

printf "[%s\n]" "${json_out:0:-1}" > snippets.json
