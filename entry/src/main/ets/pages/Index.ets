import { MemoMenu } from '../components/menu/Menu';
import { KVStore } from '../model/KVStore';
import { MemoKVStore } from '../model/MemoKVStore'
import { FileContent } from '../components/content/FileContent'
import { FileType } from '../constant/type'
import { JSON } from '@kit.ArkTS';
import { mViewModel } from '../model/viewmodel/mViewModel'
import { MenuToolManager } from '../model/viewmodel/menuToolManager'
import {
  HeaderListType
} from '../constant/MenuHeaderData'

@Entry
@Component
struct Index {
  @State fullMode: boolean = false;
  MemoKVInstance: MemoKVStore | undefined = undefined
  @Provide @Watch('onMViewModelChange') memoViewModel: mViewModel = new mViewModel()
  @State menuToolManager: MenuToolManager = new MenuToolManager()

  onMViewModelChange() {
    if (this.menuToolManager?.menuToolMap.size) {
      this.menuToolManager.menuToolMap.get(HeaderListType.NEW_FILE)?.updateActive!()
    }
  }

  aboutToAppear(): void {
    const KVManager = new KVStore(getContext())
    KVManager.getKVStore('Memo').then((res) => {
      this.MemoKVInstance = new MemoKVStore(res)
      this.memoViewModel.initKVStore(this.MemoKVInstance)
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
          this.memoViewModel.fileList = JSON.parse(res) as FileType[]
          if (this.memoViewModel.fileList?.length) {
            this.memoViewModel.curFile = this.memoViewModel.fileList[0]
          }
        }
      })
    })
    this.menuToolManager.init(this.memoViewModel)
  }

  build() {
    Row() {
      MemoMenu({ memoViewModel: this.memoViewModel, menuToolManager: this.menuToolManager })
        .width('40%')
      FileContent({
        memoViewModel: this.memoViewModel, menuToolManager: this.menuToolManager,
      })
        .width('60%')
    }
    .width('100%')
    .height('100%')
  }
}