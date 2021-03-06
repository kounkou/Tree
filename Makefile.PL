use strict;
use warnings;

require 5.006000;

use ExtUtils::MakeMaker;

# ----------------------

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my(%params) =
(
	($] ge '5.005') ?
	(
		AUTHOR   => 'Rob Kinyin (rkinyon@cpan.org)',
		ABSTRACT => 'Persist multiple trees in a single db table, preserving child order',
	) : (),
	clean =>
	{
		FILES => 'blib/* Makefile MANIFEST Tree-*'
	},
	dist =>
	{
		COMPRESS => 'gzip',
		SUFFIX   => 'gz'
	},
	DISTNAME			=> 'Tree',
	MIN_PERL_VERSION	=> 5.006,
	NAME				=> 'Tree',
	PL_FILES			=> {},
	PREREQ_PM			=>
	{
		'base'			=> 0,
		'constant'		=> 0,
		'Data::Dumper'	=> 2.161,
		'Exporter'		=> 5.71,
		'lib'			=> 0,
		'overload'		=> 0,
		'Scalar::Util'	=> 1.45,
		'strict'		=> 0,
		'warnings'		=> 0,
	},
	test =>
	{
		'TESTS' => 't/*.t t/Tree_Binary/*.t t/Tree/*.t t/Tree_Fast/*.t',
	},
	TEST_REQUIRES =>
	{
		'Test::Deep'			=> 1.123,
		'Test::Exception'		=> 0.43,
		'Test::Pod'				=> 1.51,
		'Test::Pod::Coverage'	=> 1.10,
		'Test::More'			=> 1.302056,
		'Test::Warn'			=> 0.30,
	},
	VERSION_FROM => 'lib/Tree.pm',
);

if ( ($ExtUtils::MakeMaker::VERSION =~ /^\d\.\d\d$/) && ($ExtUtils::MakeMaker::VERSION > 6.30) )
{
	$params{LICENSE} = 'perl';
}

if ($ExtUtils::MakeMaker::VERSION ge '6.46')
{
	$params{META_MERGE} =
	{
		'meta-spec' =>
		{
			version => 2,
		},
		resources =>
		{
			bugtracker =>
			{
				web => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Tree',
			},
			license		=> 'http://dev.perl.org/licenses/',
			repository	=>
			{
				type	=> 'git',
				url		=> 'https://github.com/ronsavage/Tree.git',
				web		=> 'https://github.com/ronsavage/Tree',
			},
		},
	};
}

WriteMakefile(%params);
