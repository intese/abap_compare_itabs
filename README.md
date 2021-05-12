# abap_compare_itabs
Tool for easy compare two itabs in your abap code

## How to use
### Importing via AbapGit

https://github.com/abapGit/abapGit

### Compare two tables
```abap
data itab_makt_old type standard table of makt.
data itab_makt_new like itab_makt_old.

" given
itab_makt_old = value #(
  (
    maktg = 'BAR'
    maktx = 'Bar Produkte'
    mandt = '010'
    matnr = '11111111'
    spras = 'DE'
  )
  (
    maktg = 'BAR'
    maktx = 'Bar products'
    mandt = '010'
    matnr = '11111111'
    spras = 'EN'
  )
).

itab_makt_new = value #(
  (
    maktg = 'FOO'
    maktx = 'Foo Produkte'
    mandt = '010'
    matnr = '11111111'
    spras = 'DE'
  )
  (
    maktg = 'FOO'
    maktx = 'Foo products'
    mandt = '010'
    matnr = '11111111'
    spras = 'EN'
   )
  ).
  
data(lo_compare_tool) = new zcl_tools_comp_itabs( ).

lo_compare_tool->add_changes_by(
    iv_tablename = 'MARA'
    wa_new = itab_mara_new
    wa_old = itab_mara_old ).

data(lt_result_1) = lo_compare_tool->return_changes( ).
* (
*   table_name = 'MARA'
*   field_name = 'MAKTX'
*   tabix      = 4
*   value_old  = 'Bar Produkte'
*   value_new  = 'Foo Produkte'
* )
* (
*   table_name = 'MARA'
*   field_name = 'MAKTG'
*   tabix      = 5
*   value_old  = 'BAR'
*   value_new  = 'FOO'
* )
* (
*   table_name = 'MARA'
*   field_name = 'MAKTX'
*   tabix      = 4
*   value_old  = 'Bar products'
*   value_new  = 'Foo products'
* )
* (
*   table_name = 'MARA'
*   field_name = 'MAKTG'
*   tabix      = 5
*   value_old  = 'BAR'
*   value_new  = 'FOO'
* )

### Compare two work areas
data wa_mara_old type mara.
data wa_mara_new like wa_mara_old.

" given
wa_mara_old = value #(
  matnr = '10111115'
  meins = 'ST'
  ean11 = '10235689741'
  zzmhdd = 1
 ).

wa_mara_new = value #(
  matnr = '10111116'
  meins = 'VPE'
  ean11 = '10235689742'
  zzmhdd = 2
 ).
 
lo_compare_tool->compare_itabs(
    iv_tablename = 'MARA'
    itab_old = wa_mara_old
    itab_new = wa_mara_new ).
    
data(lt_result_2) = lo_compare_tool->return_changes( ).  
* (
*   table_name = 'MARA'
*   field_name = 'MATNR'
*   tabix      = 1
*   value_old  = '10111115'
*   value_new  = '10111116'
* )
* (
*   table_name = 'MARA'
*   field_name = 'MEINS'
*   tabix      = 1
*   value_old  = 'ST'
*   value_new  = 'VPE'
* )
* (
*   table_name = 'MARA'
*   field_name = 'EAN11'
*   tabix      = 1
*   value_old  = '10235689741'
*   value_new  = '10235689742'
* )
* (
*   table_name = 'MARA'
*   field_name = 'ZZMHDD'
*   tabix      = 1
*   value_old  = '1'
*   value_new  = '2'
* )
