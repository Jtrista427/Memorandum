import { MemoMenu } from '../components/menu/Menu';
import { KVStore } from '../model/KVStore';
import { MemoKVStore } from '../model/MemoKVStore'
import { FileContent } from '../components/content/FileContent'
import { FileType } from '../constant/type'
import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct Index {
  @State fullMode: boolean = false;
  @Provide MemoKVInstance: MemoKVStore | undefined = undefined
  @State fileList: FileType[] | undefined = undefined

  aboutToAppear(): void {
    const KVManager = new KVStore(getContext())
    KVManager.getKVStore('Memo').then((res) => {
      this.MemoKVInstance = new MemoKVStore(res)
      this.MemoKVInstance?.put('mFileList', JSON.stringify([{
        id: 1,
        title: '啥也',
        content: '你哈哈哈哈哈',
        time: '2021-01-01',
        typeColor: Color.Red,
        folderName: 'cniaqochnoqchn'
      }]))
      this.MemoKVInstance?.get('mFileList').then((res) => {
        if (typeof res === 'string') {
          this.fileList = JSON.parse(res) as FileType[]
        }
      })
    })
  }

  build() {
    Row() {
      MemoMenu({ fileList: this.fileList })
        .width('40%')
      FileContent({ fileData: this.fileList?.[0] })
        .width('60%')
    }
    .width('100%')
    .height('100%')
  }
}