import distributedKVStore from '@ohos.data.distributedKVStore'
import common from '@ohos.app.ability.common'

export class KVStore {
  private static instance: KVStore
  private kvManager: distributedKVStore.KVManager | undefined
  private kvStore: distributedKVStore.SingleKVStore | undefined

  initKVStore(ctx: common.UIAbilityContext) {
    const kvManagerConfig: distributedKVStore.KVManagerConfig = {
      context: ctx,
      bundleName: 'com.example.bankdemo_template'
    };
    this.kvManager = distributedKVStore.createKVManager(kvManagerConfig)
    const options: distributedKVStore.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: false,
      // kvStoreType不填时，默认创建多设备协同数据库
      kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
      // 多设备协同数据库：kvStoreType: distributedKVStore.KVStoreType.DEVICE_COLLABORATION,
      securityLevel: distributedKVStore.SecurityLevel.S1
    };
    this.kvManager.getKVStore<distributedKVStore.SingleKVStore>('BankDemoTemplate', options,
      (err, store: distributedKVStore.SingleKVStore) => {
        if (err) {
          console.error(`Failed to get KVStore: Code:${err.code},message:${err.message}`);
          return;
        }
        console.info('Succeeded in getting KVStore.');
        this.kvStore = store
      })
  }

  getKVStore(): distributedKVStore.SingleKVStore | undefined {
    return this.kvStore
  }

  private constructor() {
  }

  static getInstance(): KVStore {
    if (!KVStore.instance) {
      KVStore.instance = new KVStore()
    }
    return KVStore.instance
  }
}