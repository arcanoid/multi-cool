module UnitsHelper
  def length_units_for_select
    [
        ['feet (ft)', 'ft'],
        ['survey feet (sfoot)', 'sfoot'],
        ['yards (yd)', 'yd'],
        ['kilometer (km)', 'km'],
        ['meter (m)', 'm'],
        ['decimeter (dm)', 'dm'],
        ['centimeter (cm)', 'cm'],
        ['millimeter (mm)', 'mm'],
        ['hectometer (hm)', 'hm'],
        ['dekameter (dam)', 'dam'],
        ['nanometer (nm)', 'nm'],
        ['miles (mi.)', 'mi'],
        ['naut-miles (nmi.)', 'nmi'],
        ['leagues', 'leagues'],
        ['naut-leagues', 'nleagues'],
        ['rods', 'rd'],
        ['fathom', 'fathom'],
        ['mils', 'mil'],
        ['angstroms', 'angstrom'],
        ['furlong (fur)', 'fur']
    ]
  end

  def time_units_for_select
    [
        ['minutes (min)', 'min'],
        ['hours (h)', 'hrs'],
        ['seconds (sec)', 'sec'],
        ['days', 'day'],
        ['weeks', 'weeks'],
        ['years', 'years'],
        ['decades', 'decades'],
        ['centuries', 'centuries'],
        ['fortnights', 'fortnight']
    ]
  end

  def weight_units_for_select
    [
        ['kilograms (kg)', 'kg'],
        ['centigrams (cg)', 'cg'],
        ['decigrams (dg)', 'dg'],
        ['grams (g)', 'g'],
        ['milligrams (mg)', 'mg'],
        ['hectogram (hg)', 'hg'],
        ['dekagrams (dag)', 'dag'],
        ['pound (lb)', 'lb'],
        ['AMU', 'amu'],
        ['daltons', 'daltons'],
        ['tonne', 'tonne'],
        ['short-ton', 'tons'],
        ['carats', 'carats'],
        ['ounce (oz)', 'oz']
    ]
  end

  def area_units_for_select
    [
        ['hectare', 'hectare'], 
        ['acres', 'acre'],
        ['square feet', 'sqft'],
        ['square inches', 'sqin']
    ]
  end
end
