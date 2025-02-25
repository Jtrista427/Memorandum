import { FileType } from '../../constant/type'
import { GetDatetime } from '../../utils/timeHandler'
import { MemoKVStore } from '../../model/MemoKVStore'

@Observed
export class mViewModel {
  curFile: FileType | undefined = undefined
  fileList: FileType[] = []
  isEdit: boolean = false
  MemoKVInstance: MemoKVStore | undefined = undefined

  initKVStore(MemoKVInstance: MemoKVStore) {
    this.MemoKVInstance = this.MemoKVInstance
  }

  // 新建一个备忘录
  newMemo() {
    this.curFile = {
      id: (this.fileList?.length ?? 0) + 1,
      title: $r('app.string.title'),
      content: '',
      time: GetDatetime(Date.now()),
      typeColor: $r('app.color.default_folder_color'),
      folderName: $r('app.string.default')
    }
    this.fileList?.push(this.curFile)
  }

  saveFile() {
    this.isEdit = false
    const isExit = this.fileList.findIndex((item) => {
      return item.id === this.curFile!.id
    })
    if (isExit !== -1) {
      this.fileList[isExit] = this.curFile!
    } else {
      this.fileList.push(this.curFile!)
    }
    this.MemoKVInstance?.put('mFileList', JSON.stringify(this.fileList))
  }
}