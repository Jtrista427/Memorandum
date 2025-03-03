import distributedKVStore from '@ohos.data.distributedKVStore'
import { BusinessError } from '@kit.BasicServicesKit';

export class KVStore {
  private static instance: KVStore
  private kvManager: distributedKVStore.KVManager | undefined

  constructor(ctx: Context) {
    const kvManagerConfig: distributedKVStore.KVManagerConfig = {
      context: ctx,
      bundleName: 'com.example.com.example.memorandum'
    };
    this.kvManager = distributedKVStore.createKVManager(kvManagerConfig)
  }

  // 获取键值数据库实例
  async getKVStore(storeId: string): Promise<distributedKVStore.SingleKVStore | undefined> {
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
    if (this.kvManager) {
      return new Promise((resolve, reject) => {
        this.kvManager!.getKVStore<distributedKVStore.SingleKVStore>(storeId, options, (err, store) => {
          if (err) {
            console.error(`获取KVStore失败：错误码：${err.code}，错误信息：${err.message}`);
            reject(err);
          } else {
            console.info('成功获取KVStore。');
            resolve(store);
          }
        });
      });
    } else {
      console.error('KVManager未初始化，无法获取KVStore。');
      return undefined;
    }
  }

  // 关闭指定的分布式键值数据库
  closeKVStore(appId: string, storeId: string): void {
    if (this.kvManager) {
      this.kvManager.closeKVStore(appId, storeId, (err: BusinessError) => {
        if (err) {
          console.error(`关闭KVStore失败。错误码：${err.code}，错误信息：${err.message}`);
        } else {
          console.info('成功关闭KVStore。');
        }
      });
    } else {
      console.error('KVManager未初始化，无法关闭KVStore。');
    }
  }
}