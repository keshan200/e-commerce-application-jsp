package lk.ijse.ecommerceapplication_jsp.DTO;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CustomerDTO {

    private String firstName;
    private String lastName;
    private String address;
    private String telephone;
    private String email;
    private String accountType;
}
