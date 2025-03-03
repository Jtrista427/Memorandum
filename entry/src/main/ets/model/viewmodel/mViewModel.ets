import { FileType } from '../../constant/type'
import { GetDatetime } from '../../utils/timeHandler'
import { MemoKVStore } from '../../model/MemoKVStore'

@Observed
export class mViewModel {
  curFile: FileType | undefined = undefined
  fileList: FileType[] = []
  isEditMode: boolean = false // 右侧面板是否进入编辑模式
  MemoKVInstance: MemoKVStore | undefined = undefined
  isNewFile: boolean = false

  initKVStore(MemoKVInstance: MemoKVStore) {
    this.MemoKVInstance = MemoKVInstance
  }

  // 新建一个备忘录
  newMemo() {
    if (!this.isNewFile) {
      this.curFile = {
        id: (this.fileList?.length ?? 0) + 1,
        title: $r('app.string.title'),
        content: '',
        time: GetDatetime(Date.now()),
        typeColor: $r('app.color.default_folder_color'),
        folderName: $r('app.string.default'),
      }
      this.fileList?.push(this.curFile)
      this.isNewFile = true
    }
  }

  editFile() {
    if (this.isNewFile) {
      this.isNewFile = false
    }
  }

  saveFileToStore() {
    const isExit = this.fileList.findIndex((item) => {
      return item.id === this.curFile!.id
    })
    // 更新保存时间
    this.curFile!.time = GetDatetime(Date.now())
    if (isExit !== -1) {
      this.fileList[isExit] = this.curFile!
    } else {
      this.fileList.push(this.curFile!)
    }
    this.MemoKVInstance?.put('mFileList', JSON.stringify(this.fileList))
  }
}