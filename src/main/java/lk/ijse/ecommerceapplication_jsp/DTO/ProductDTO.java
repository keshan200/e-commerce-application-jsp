package lk.ijse.ecommerceapplication_jsp.DTO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductDTO {

    private String itemName;
    private String itemDescription;
    private String itemImage;
    private int quantity;
    private Double unitPrice;
    private String material;
    private int categoryID;
}
