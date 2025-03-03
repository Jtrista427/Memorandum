import distributedKVStore from '@ohos.data.distributedKVStore'

export class MemoKVStore {
  private kvStore: distributedKVStore.SingleKVStore | undefined;

  constructor(kvStore: distributedKVStore.SingleKVStore | undefined) {
    this.kvStore = kvStore;
  }

  put(key: string, value: Uint8Array | string | number | boolean) {
    if (this.kvStore) {
      this.kvStore.put(key, value, (err) => {
        if (err) {
          console.error(`Put failed: ${err.code} - ${err.message}`);
        } else {
          console.info('Put succeeded.');
        }
      });
    } else {
      console.error('KVStore未初始化，无法插入数据。');
    }
  }

  // 获取数据
  async get(key: string): Promise<Uint8Array | string | number | boolean | undefined> {
    if (this.kvStore) {
      return new Promise((resolve, reject) => {
        this.kvStore!.get(key, (err, data) => {
          if (err) {
            console.error(`获取数据失败。错误码：${err.code}，错误信息：${err.message}`);
            reject(err);
          } else {
            console.info('成功获取数据。');
            resolve(data);
          }
        });
      });
    } else {
      console.error('KVStore未初始化，无法获取数据。');
      return undefined;
    }
  }

  // 删除数据
  delete(key: string): void {
    if (this.kvStore) {
      this.kvStore.delete(key, (err) => {
        if (err) {
          console.error(`删除数据失败。错误码：${err.code}，错误信息：${err.message}`);
        } else {
          console.info('成功删除数据。');
        }
      });
    } else {
      console.error('KVStore未初始化，无法删除数据。');
    }
  }
}