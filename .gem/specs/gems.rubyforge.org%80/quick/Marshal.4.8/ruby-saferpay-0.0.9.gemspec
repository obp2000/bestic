u:Gem::Specification�["
0.9.4i"ruby-saferpayU:Gem::Version["
0.0.9Iu:	Time���    :@marshal_with_utc_coercionF"?Ruby interface to the saferpay e-commerce payment providerU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"
log4r:@version_requirementsU;[[[">U; ["
0.0.0o;	;
0;"hpricot;U;[[[">U; ["
0.0.0o;	;
0;"hoe;U;[[[">=U; ["
1.3.0"ruby-saferpay"dpalm@elctech.com["!David Palm (ELC Tecnologies)"�The SCAI interface is used when the merchant wishes to keep the acquirer on her/his own website for the whole duration of the transaction (client payment details transits through *both* the merchant site and the saferpay database ) whereas VT implies a redirect to the saferpay site.  == FEATURES/PROBLEMS:  * supports both common credit cards and direct debit cards (&quot;Lastschrift&quot;) * support for VT style payments is incomplete  == SYNOPSIS:  Init (info from saferpay test account; they're the same for all test accounts): @pan        =  &quot;9451123100000004&quot;        #  Saferpay test PAN @accountid  =  &quot;99867-94913159&quot;          #  Saferpay test ACCOUNTID @exp        =  &quot;1107&quot;                    #  This will change for other test accounts I guess... Might just be three months ahead of Time.now @sfp  = Saferpay.new( @accountid, @pan, @exp )  Reserve: &lt;tt&gt;@sfp.reserve(30000, &quot;USD&quot;)&lt;/tt&gt;  Amounts are divided by 100. We're talking cents here, not dollars...  Capture last transaction: &lt;tt&gt;@sfp.capture&lt;/tt&gt;  Capture with a transacaton ID &quot;4hj34hj4hh34h4j3hj4h334&quot;: &lt;tt&gt;@sfp.capture(&quot;4hj34hj4hh34h4j3hj4h334&quot;)&lt;/tt&gt;  == REQUIREMENTS:"F= ELC-Tecnologies[http://www.elctech.com], http://www.elctech.comT@0