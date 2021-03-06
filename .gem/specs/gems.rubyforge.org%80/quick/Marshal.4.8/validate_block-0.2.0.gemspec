u:Gem::Specification�["
1.3.7i"validate_blockU:Gem::Version["
0.2.0u:	Time���    "|This gem allows similar ActiveRecord validates_* commands to be grouped together in blocks and pruned of repeated parametersU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
2.0.4:
@name"rubyforge:@requirement@ :@prereleaseF:
@type:developmento;
;	U;[[[">=U; ["
2.6.1;
"hoe;@*;F;;"validate_block["xunker@pyxidis.org["Matthew Nielsen"�This gem allows similar ActiveRecord validates_* commands to be grouped together in blocks and pruned of repeated parameters.

How often have you had a block of validation commands in an ActiveRecord object that are repeated, especially :id or :unless options?  Does this look familiar?

  validates_presence_of  :hair, :hair_color, :unless =&gt; :bald?
  validates_length_of    :hair, :within =&gt; 3..15, :unless =&gt; :bald?
  validates_inclusion_of :hair_color, :in =&gt; HAIR_COLORS, :unless =&gt; bald?

Instead, this gem will allow you to replace the above code with:

  validate_block :unless =&gt; :bald? do
    presence_of  :hair, :hair_color
    length_of    :hair, :within =&gt; 3..15
    inclusion_of :hair_color, :in =&gt; HAIR_COLORS
  end

..which is a great way to DRY your :hair, don't you think?

Basically, this gem 1) removes the requirement to have 'validates_' on the front of the commands and 2) passes the options on the validate_block command to each validation command inside the block.

The syntax of the validation commands remains the same.  Keeping the 'validates_*' prefix on the commands inside the block _will_ work but it is not required.",http://github.com/xunker/validate_blockT@[ 