use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'      => 'Sledge::Plugin::NoCache',
    'VERSION_FROM' => 'lib/Sledge/Plugin/NoCache.pm', # finds $VERSION
    'PREREQ_PM' => {
	Test::More => 0.32,
    },
);
