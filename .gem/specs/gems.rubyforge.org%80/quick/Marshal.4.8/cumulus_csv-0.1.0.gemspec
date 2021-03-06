u:Gem::Specification["
1.3.6i"cumulus_csvU:Gem::Version["
0.1.0Iu:	Timew��    :@marshal_with_utc_coercionF"�Helps you save uploaded csv files containing data to amazon s3, and gives you a way to download and loop through the data in a background process easilyU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:@requirement@ :
@type:development:@prereleaseF:
@name"thoughtbot-shouldao;	
;
U;[[[">=U; ["
0.9.8;@*;;;F;"
mochao;	
;
U;[[[">=U; ["
0.6.2;@4;:runtime;F;"aws-s30"ethan.vizitei@gmail.com["evizitei"rCSV Files: I hate them, you probably do too, but sometimes you need to get data into your system and this is the only way it's happening.  

    If you're deploying a rails app in a cloud setup, you may have troubles if you're trying to store an uploaded file locally and process it later in a background thread (I know I have).  

    cumulus_csv is one way to solve that problem.  You can save your file to your S3 account, and loop over the data inside it at your convenience later.  So it doesn't matter where you're doing the processing, you just need to have the key you used to store the file, and you can process away."+http://github.com/evizitei/cumulus_csvT@[ 