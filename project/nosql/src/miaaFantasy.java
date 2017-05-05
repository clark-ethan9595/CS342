/**
 * Created by Ethan Clark on 5/5/2017.
 * Final Project - CS342
 *
 * Project Extensions Checkpoint
 *
 * NoSQL version of some of my final project tables
 */

import oracle.kv.*;

public class miaaFantasy {

    public static void main(String[] args) {

        // Instantiate the kvStore
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));


        // Close the kvStore
        store.close();

    }
}
