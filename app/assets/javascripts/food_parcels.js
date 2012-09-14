
function add_row_to_table() {
  var table = $("#parcel_lines_table")
  var tr = $(table).find("tr:last").clone();
  var old_index = calculate_row_index(tr);
  var new_index = parseInt(old_index) + 1;

  $(tr).attr("id", $(tr).attr("id").replace(old_index, new_index))
  $(tr).find("input[type!='button']").each(function(index, input) {
    $(input).attr("id", $(input).attr("id").replace(old_index, new_index));
    $(input).attr("name", $(input).attr("name").replace(old_index, new_index));
    $(input).val("");
  });    
  
  add_code_typeahead($(tr).find(".product_code_typeahead"));
  add_name_typeahead($(tr).find(".product_name_typeahead"));
  
  $(table).find("tr:last").after(tr);  
  $(tr).find("input[type='text']").first().focus();
}

function calculate_row_index(row) {
  var array = row.attr("id").split("_");
  return array[array.length - 1]
}

function remove_row(button) {
  var tr = $(button).closest("tr");
  $(tr).remove();
}

function add_code_typeahead(elem) {
  if(elem.length) {
    elem.typeahead({ 
      source: productCodes, 
      updater: function(item) {
        set_product_name(this.$element.attr('id'), item); 
        select_product_quantity(this.$element.attr('id'));
        return item;
      }
    });    
  }
}

function add_name_typeahead(elem) {
  if(elem.length) {
    elem.typeahead({ 
      source: productNames, 
      updater: function(item) {
        set_product_code(this.$element.attr('id'), item); 
        select_product_quantity(this.$element.attr('id'));
        return item;
      }
    }); 
  }
}

function select_product_quantity(field_id) {
  quantity_field_id = "new_food_parcel_lines_" + field_id.match(/\d+/) + "_quantity"
  $("#" + quantity_field_id).focus();
}

function set_product_name(code_field_id, product_code) {
  name_field_id = code_field_id.replace("_code", "_name");
  name_field = $("#" + name_field_id);
  name_field.val(productMatrix[product_code]['name']);
  id_field = name_field.closest('tr').find('input[type="hidden"]');
  id_field.val(productMatrix[product_code]['id']);  
}

function set_product_code(name_field_id, product_name) {
  code_field_id = name_field_id.replace("_name", "_code");
  code_field = $("#" + code_field_id);
  code_field.val(inverseProductMatrix[product_name]['code']);
  code_field.prev("input").val(inverseProductMatrix[product_name]['id']);
}

add_code_typeahead($(".product_code_typeahead"));
add_name_typeahead($(".product_name_typeahead"));

$('a.row-delete[data-method="delete"]').live('ajax:success', function(event){
  remove_row(this);
});
