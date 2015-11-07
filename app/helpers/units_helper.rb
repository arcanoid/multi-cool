module UnitsHelper
  def length_units_for_select
    [
        ['feet (ft)', 'ft'],
        ['yards (yd)', 'yd'],
        ['kilometer (km)', 'km'],
        ['meter (m)', 'm'],
        ['decimeter (dm)', 'dm'],
        ['centimeter (cm)', 'cm'],
        ['millimeter (mm)', 'mm'],
        ['hectometer (hm)', 'hm'],
        ['dekameter (dam)', 'dam'],
        ['miles (mi.)', 'mi'],
        ['furlong (fur)', 'fur']
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
        ['ounce (oz)', 'oz']
    ]
  end
end
