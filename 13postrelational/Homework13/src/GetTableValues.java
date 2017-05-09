import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import java.sql.SQLException;

/**
 * Created by elc3 on 5/9/2017.
 */
public class GetTableValues {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        LoadDB.loadDatabase(store);



        store.close();
    }
}
