(ns armstrong-numbers)

(defn armstrong?
  "Returns true if the given number is an Armstrong number;
  otherwise, it returns false."
  [num]
  (let [digits (map #(Character/digit % 10) (str num))
        k (count digits)]
    (= num (reduce +' (map #(reduce *' (repeat k %)) digits))))  
  )
