
package dao;

import java.util.List;
import models.HoaDon;
import models.Thang;

/**
 *
 * @author duato
 */
public interface HoaDonDAO {
    public List<HoaDon> getList();
    public boolean deleteData(long maHoaDon);
    public int createHoaDon(HoaDon hoaDon);
    public int updateBillStatus(int maHD);
    public List<HoaDon> getListOfThang(Thang thang);
}
