interface zif_tools_comp_itabs
  public .
  types: begin of ty_changed_data,
           table_name type string,
           field_name type string,
           tabix      type sy-tabix,
           value_old  type string,
           value_new  type string,
           chngind    type cdchngind,
         end of ty_changed_data.

  types tt_changed_data type standard table of ty_changed_data with key table_name field_name tabix.
endinterface.
