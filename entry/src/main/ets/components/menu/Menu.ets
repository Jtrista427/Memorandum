import { MenuHeader } from '../MenuHeader'
import { menuHeaderData } from '../../constant/MenuHeaderData'
import { FileType } from '../../constant/type'

@Component
export struct MemoMenu {
  @Prop fileList: FileType[] = [{
    id: 1,
    title: '啥也',
    content: '你哈哈哈哈哈',
    time: '2021-01-01',
    typeColor: Color.Red,
    folderName:'cniaqochnoqchn'
  }]

  @Builder
  menuTitle() {
    Text($r('app.string.all_memo'))
      .fontSize(26)
      .width('100%')
      .fontWeight(FontWeight.Bold)
    Text($r('app.string.memo_num', this.fileList.length))
      .fontSize(14)
      .width('100%')
  }

  @Builder
  FileItem(file: FileType) {
    Row() {
      Column({ space: 10 }) {
        Row({ space: 5 }) {
          Column()
            .width(5)
            .height(16)
            .backgroundColor(file.typeColor)
          Text(file.title)
            .fontWeight(FontWeight.Bold)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .fontSize(16)
        }
        .width('100%')

        Text(`${file.time} ${file.content}`)
          .fontSize(14)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
      }
      .width('100%')
      .backgroundColor(Color.Yellow)
      .height(60)
      .borderRadius(20)
      .padding({
        left: 15,
        right: 10,
        top: 5,
        bottom: 5
      })
    }
    .width('100%')
    .borderRadius(20)
    .backgroundColor(Color.White)
    .padding(5)
  }

  build() {
    Column({ space: 10 }) {
      MenuHeader({ headerData: menuHeaderData })
      this.menuTitle()

      Row() {
        Image($r('app.media.search'))
          .width(20)
          .width(20)
          .margin({ left: 10 })
        TextInput({ placeholder: $r('app.string.search') })
          .height(40)
          .layoutWeight(1)
          .backgroundColor($r('app.color.search_gray'))
          .padding({ left: 5 })
          .onChange((value: string) => {
            console.log(value)
          })
          .cancelButton({
            style: CancelButtonStyle.INPUT, icon: {
              size: 18,
              src: $r("app.media.close"),
              color: $r('app.color.search_close')
            }
          })
      }
      .width('100%')
      .backgroundColor($r('app.color.search_gray'))
      .borderRadius(20)

      List() {
        ForEach(this.fileList, (item: FileType) => {
          ListItem() {
            this.FileItem(item)
          }
        })

      }.width('100%')
      .layoutWeight(1)
    }
    .padding({ left: 20, right: 10, top: 15 })
    .backgroundColor($r('app.color.light_gray'))
  }
}