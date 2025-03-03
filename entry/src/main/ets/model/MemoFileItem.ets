import { FileType } from '../constant/type'

@Observed
export class MemoFileItem {
  id: number
  title: string | Resource
  content: string
  time: string
  typeColor: string | Resource | Color
  folderName: string | Resource
  isStar?: boolean

  constructor(params: FileType) {
    this.id = params.id
    this.title = params.title
    this.content = params.content
    this.time = params.time
    this.typeColor = params.typeColor
    this.folderName = params.folderName
    this.isStar = params.isStar ?? false
  }
}