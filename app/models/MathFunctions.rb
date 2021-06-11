class MathFunctions

    def merge_sorted(arr1, arr2)
        result = []
        i = 0
        j = 0
        while arr1.length !=0 && arr2.length !=0 do 
            if arr1[0]<=arr2[0] 
                result.push(arr1.shift())
            else 
                result.push(arr2.shift())
            end
        end
        return result.concat(arr1).concat(arr2)
    end

    def merge_sort(arr) 
        return arr if arr.length<=1 
        mid = (arr.length/2).floor()
        left = merge_sort(arr.slice(0, mid))
        right = merge_sort(arr.slice(mid, (arr.length - mid)))
        return merge_sorted(left, right)

    end
    

end