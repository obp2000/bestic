u:Gem::Specification�["
1.3.6i"cloudspongeU:Gem::Version["
0.9.6Iu:	Time���    :@marshal_with_utc_coercionF"0A library wrapper for Cloudsponge.com's APIU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"graeme@cloudsponge.com["Graeme Rouse"�    Usage:
      contacts = nil
      importer = Cloudsponge::ContactImporter.new(DOMAIN_KEY, DOMAIN_PASSWORD)
      importer.begin_import('YAHOO')
      loop do
        events = importer.get_events
        break unless events.select{ |e| e.is_error? }.empty?
        unless events.select{ |e| e.is_completed? }.empty?
          contacts = importer.get_contacts
          break
        end
      end
"http://www.cloudsponge.comT@[ 