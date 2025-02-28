import { MenuHeader } from '../MenuHeader'
import { contentHeaderReadData, contentHeaderEditData } from '../../constant/MenuHeaderData'
import { mViewModel } from '../../model/viewmodel/mViewModel'
import { MemoMenuItem } from '../../model/MemoMenuItem'

@Component
export struct FileContent {
  @ObjectLink memoViewModel: mViewModel
  private titleController: TextAreaController = new TextAreaController()
  private contentController: TextAreaController = new TextAreaController()
  editMenuData: MemoMenuItem[] = []
  readMenuData: MemoMenuItem[] = []

  build() {
    Column({ space: 15 }) {
      if (this.memoViewModel.isEditMode) {
        MenuHeader({ headerData: this.editMenuData })
      } else {
        MenuHeader({ headerData: this.readMenuData })
      }

      Divider()
        .strokeWidth(1)
        .width('98%')
      TextArea({
        placeholder: $r('app.string.title'),
        text: this.memoViewModel?.curFile?.title,
        controller: this.titleController
      })
        .height(40)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .backgroundColor(Color.White)
        .padding({ left: 5 })
        .onFocus(() => {
          if (this.memoViewModel && !this.memoViewModel.isEditMode) {
            this.memoViewModel.isEditMode = true
          }
        })
        .onChange((value) => {
          this.memoViewModel.editFile()
          this.memoViewModel?.curFile && (this.memoViewModel.curFile.title = value)
        })
      Row({ space: 5 }) {
        Row() {
          Text(this.memoViewModel?.curFile?.folderName ?? $r('app.string.default'))
            .fontColor(Color.White)
          Image($r("app.media.caret_down"))
            .width(10)
            .height(10)
        }
        .align(Alignment.Center)
        .padding(5)
        .height(30)
        .borderRadius(10)
        .backgroundColor(this.memoViewModel?.curFile?.typeColor ?? Color.Yellow)

        Text(this.memoViewModel?.curFile?.time)

      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      TextArea({ text: this.memoViewModel?.curFile?.content, controller: this.contentController })
        .backgroundColor(Color.White)
        .padding({ left: 5 })
        .height('100%')
        .onFocus(() => {
          if (this.memoViewModel && !this.memoViewModel.isEditMode) {
            this.memoViewModel.isEditMode = true
          }
        })
        .onChange((value) => {
          this.memoViewModel.editFile()
          this.memoViewModel?.curFile && (this.memoViewModel.curFile.content = value)
        })
    }
    .width('100%')
    .height('100%')
    .padding({ top: 15, left: 10, right: 10 })
  }
}