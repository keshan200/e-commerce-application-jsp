package lk.ijse.ecommerceapplication_jsp.DTO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CategoryDTO {

    private int id;
    private String category;
    private String categoryImage;

    public CategoryDTO(String category, String categoryImage) {
        this.category = category;
        this.categoryImage = categoryImage;
    }


    public CategoryDTO(int id, String category) {
        this.id = id;
        this.category = category;
    }
}
