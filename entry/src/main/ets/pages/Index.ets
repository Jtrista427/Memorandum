import { MemoMenu } from '../components/menu/Menu';
import { KVStore } from '../model/KVStore';
import { FileContent } from '../components/content/FileContent'
import { FileType } from '../constant/type'

@Entry
@Component
struct Index {
  @State fullMode: boolean = false;
  @Provide KVInstance: KVStore = KVStore.getInstance()
  @State fileList: FileType[] = [{
    id: 1,
    title: '啥也',
    content: '你哈哈哈哈哈',
    time: '2021-01-01',
    typeColor: Color.Red,
    folderName: 'cniaqochnoqchn'
  }]

  aboutToAppear(): void {
  }

  build() {
    Row() {
      MemoMenu()
        .width('40%')
      FileContent({ fileData: this.fileList[0] })
        .width('60%')
    }
    .width('100%')
    .height('100%')
  }
}